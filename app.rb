require 'sinatra'
require "sinatra/reloader"

configure do
	enable :sessions
end

helpers do
  def login?
		session[:login]
  end
end

before %r{/([\w]+)} do
  #halt(401, "Not Authorized") unless login?
  redirect "http://localhost:4567" unless login?
end

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
		session[:login] = true
		erb :create
		#redirect "http://localhost:4567/create"	
	else
		#redirect "http://localhost:4567"	
		erb :login
	end
end

get '/create' do
  #halt(401, "Not Authorized") unless login?
	erb :create
end

get '/run' do
  #halt(401, "Not Authorized") unless login?
	erb :run
end

get '/report' do
  #halt(401, "Not Authorized") unless login?
	erb :report
end

get '/logout' do
	session.clear
end

=begin
get '/runtest' do
	File.new('public/html/runtest.html').readlines
end
=end
