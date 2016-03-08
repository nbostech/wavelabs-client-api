class UserSignUp

def self.sign_up_user(user_params)
  req = WavelabsClientApi::Client::Api::Core::UsersApi.new()
  new_user = req.sign_up(user_params, get_token)
end

def self.login_user
  req = WavelabsClientApi::Client::Api::Core::AuthApi.new()
  login_u = req.login({:username => "wavlelabstest", 
  	                      :password => "test123"}, get_token)
end

def self.get_token
  obj = WavelabsClientApi::Client::Api::Core::AuthApi.new()
  req = obj.get_auth_token("client_credentials", "scope:oauth.token.verify")
  return req[:token].value.first
end

end	