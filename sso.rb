# coding: utf-8
require "sinatra"
require "sinatra/reloader"
require "omniauth"
require "omniauth-twitter" # Twitter の OAuth を使うなら必須

# Sinatra のセッションを有効にする
enable :sessions

# OmniAuth の設定
use OmniAuth::Builder do
  # Twitter の OAuth を使う
  provider :twitter, "HdL2uKpiUuQ5siZX9dBi4A", "VQKZnX4Lpl9aSpnTJxYvZCIp08DFEVc5UikGCP6jVo"
  #provider :twitter, "Consumer key", "Consumer secret"
end

get "/" do
  erb :index
end

# Twitter の認証が成功したら呼び出される
get "/auth/:provider/callback" do
  # 認証情報は request.env に格納されている
  @auth = request.env["omniauth.auth"]
  erb :home
end

__END__
@@layout
<!DOCTYPE html>
<html>
    <head>
        <title>Sinatra-OmniAuth</title>
    </head>
    <body>
        <%= yield %>
    </body>
</html>

@@index
<a href="/auth/twitter">Twitter でログイン</a>

@@home
<h1>Wellcome</h1>
<pre>
    <%= @auth %>
</pre>
