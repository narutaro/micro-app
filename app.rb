require 'sinatra'

get '/' do
		File.new('public/html/login.html').readlines
end

post '/' do
		username = params[:username]
		password = params[:password]

		if username == "inoue" && password == "xyz123"
				"good"
		else
				"no good" + "your name is #{username}\nyour password is #{password}" 
		end
end

get '/tabs' do
		File.new('public/html/tabs.html').readlines
end

get '/runtest' do
		File.new('public/html/runtest.html').readlines
end
