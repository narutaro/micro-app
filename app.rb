require 'sinatra'
require "sinatra/reloader"

get '/' do
	erb :login
end

post '/' do
	username = params[:username]
	password = params[:password]

	if username == "inoue" && password == "xyz123"
		redirect "http://localhost:4567/home"	
	else
		redirect "http://localhost:4567"	
	end
end

get '/home' do
	erb :home
end

get '/runtest' do
	File.new('public/html/runtest.html').readlines
end
