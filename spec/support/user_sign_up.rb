class UserSignUp

def self.sign_up_user(user_params)
  req = WavelabsClientApi::Client::Api::Core::UsersApi.new()
  new_user = req.sign_up(user_params)
end

def self.login_user
  req = WavelabsClientApi::Client::Api::Core::AuthApi.new()
  login_u = req.login({:username => "wavlelabstest", 
  	                      :password => "test123"})
end

end	