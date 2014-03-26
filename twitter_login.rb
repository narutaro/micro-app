require 'sinatra'
require "sinatra/reloader"
require 'omniauth-twitter'
 
use OmniAuth::Builder do
  provider :twitter, 'HdL2uKpiUuQ5siZX9dBi4A', 'VQKZnX4Lpl9aSpnTJxYvZCIp08DFEVc5UikGCP6jVo'
end

configure do
	enable :sessions
end
 
helpers do
  def admin?
    #true
		session[:admin]
  end
end
 
get '/public' do
  "This is the public page - everybody is welcome!"
end
 
get '/private' do
  halt(401,'Not Authorized') unless admin?
  "This is the private page - members only"
end

get '/login' do
	redirect to("/auth/twitter")
end

get '/auth/twitter/callback' do
  #env['omniauth.auth'] ? session[:admin] = true : halt(401,'Not Authorized')
	session[:admin] = true
	env['omniauth.auth'].to_s
	"<h1>Hi #{env['omniauth.auth']['info']['name']}!</h1><img src='#{env['omniauth.auth']['info']['image']}'>"
  #"You are now logged in"
end

get '/auth/failure' do
  params[:message]
end

get '/logout' do
	session[:admin] = nil
	"You are now logged out"
end
