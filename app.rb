require 'sinatra'
require "sinatra/reloader"

get '/test' do
	erb :test
end

get '/' do
	erb :login
end

post '/' do
	username = params[:username]
	password = params[:password]

	if username == "inoue" && password == "xyz123"
		redirect "http://localhost:4567/create"	
	else
		redirect "http://localhost:4567"	
	end
end

get '/create' do
	erb :create
end

get '/run' do
	erb :run
end

get '/report' do
	erb :report
end

=begin
get '/runtest' do
	File.new('public/html/runtest.html').readlines
end
=end
