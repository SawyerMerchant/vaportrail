require 'sinatra'
require 'sinatra/reloader'
require_relative 'helpers/tweeter'

  Figaro.application = Figaro::Application.new(
    environment: 'development',
    path: File.expand_path('config/application.yml', __FILE__)
  )
  Figaro.load



get "/" do
  #TODO fix cookie
  handle = request.cookies["handle"] || "@example"
  erb :add, locals:{handle: handle}
end

post "/add" do
  response.set_cookie("handle", params[:handle])
  #TODO redirect to /
end


post "/test" do
  t = Tweeter.new
  t.test_tweet
  redirect("/")
end