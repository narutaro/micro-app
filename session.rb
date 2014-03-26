require "sinatra"
require "sinatra/reloader"

configure do
	enable :sessions
end

before do
	content_type :txt
end

get '/' do
	redirect '/set'
end

get '/set' do
	session[:foo] = "Here is your first session id."
	"Session value set as #{session[:foo]}"
end

get '/fetch' do
	"Session value: #{session[:foo]}"
end

get '/logout' do
	session.clear
	redirect '/fetch'
end
