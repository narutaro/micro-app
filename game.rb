require 'sinatra'

before do
	content_type :txt
	@defeat = {rock: :scissors, paper: :rock, scissors: :paper}
	@throws = @defeat.keys
end

get '/throw/:type' do
	player_throw = params[:type].to_sym

	if !@throws.include?(player_throw)
		halt 403, "You must throw one of the following: #{@throws}"
	end

	computer_throw = @throws.sample

	if player_throw == computer_throw
		"YOU:#{player_throw} COM:#{computer_throw}\n You tied with the computer. Try again!"
	elsif computer_throw == @defeat[player_throw]
		"YOU:#{player_throw} COM:#{computer_throw}\n Nicely done; #{player_throw} heats #{computer_throw}"
	else
		"YOU:#{player_throw} COM:#{computer_throw}\n Ouch; #{computer_throw} beats #{player_throw}. Better luch next time!"
	end
end
