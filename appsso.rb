# -*- encoding: UTF-8 -*-
require 'rubygems'
require 'sinatra'
require 'haml'
require 'omniauth'
require 'omniauth-twitter'
 
set :haml, {:format => :html5}
enable :sessions, :logging
 
use OmniAuth::Builder do
    provider :twitter, 'HdL2uKpiUuQ5siZX9dBi4A', 'VQKZnX4Lpl9aSpnTJxYvZCIp08DFEVc5UikGCP6jVo'
end
 
get '/' do
  haml :index
end
 
get '/auth/:name/callback' do
  @auth = request.env['omniauth.auth']
  haml :index2
end

