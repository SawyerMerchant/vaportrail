require 'sinatra'
require 'sinatra/reloader'





get "/" do
  handle = "@sawyermerchant" #request.cookies["handle"] || "@example"
  erb :add, locals:{handle: handle}
end

post "/add" do
  # response.set_cookie("handle", params[:handle])
end