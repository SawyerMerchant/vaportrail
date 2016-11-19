require 'sinatra'
# require 'sinatra/reloader'
require './helpers/tweeter.rb'
require './helpers/cookie_helper.rb'
require './helpers/content_helper.rb'

helpers CookieHelper
helpers ContentHelper

get "/" do
  handle = request.cookies["handle"] || "@yourhandle"
  link = request.cookies["link"] || "link it!"
  description = request.cookies["description"] || "what's this about?"
  erb :index, locals:{ handle: handle, link: link, description: description }
end

post "/add" do
  if params[:handle].empty? || params[:link].empty? || params[:description].empty?
    redirect("/invalid")
  elsif (params[:handle] + params[:link] + params[:description]).length > 126
    redirect("/invalid")
  else
    write_new(params[:handle], params[:link], params[:description])
    add_cookie("handle", params[:handle])
    add_cookie("link", params[:link])
    add_cookie("description", params[:description])
    redirect("/add")
  end
end

get "/invalid" do
  erb :invalid
end


post "/test" do
  t = Tweeter.new
  a = t.get_content
  t.send_tweet(a[0], a[1], a[2])
  redirect("/")
end

get "/add" do
  erb :add
end

get "/queue" do
  queue = read_queue
  queue = [[nil, "Uh oh, the queue is empty...", nil]] if queue == []
  erb :queue, locals: { queue: queue }
end
