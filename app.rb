require 'sinatra'
require 'sinatra/reloader'





get "/" do
  #TODO fix cookie
  handle = request.cookies["handle"] || "@example"
  erb :add, locals:{handle: handle}
end

post "/add" do
  response.set_cookie("handle", params[:handle])
  #TODO redirect to /
end

