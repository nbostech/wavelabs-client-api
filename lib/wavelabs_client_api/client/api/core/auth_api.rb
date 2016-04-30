
# This class is responsible for handling
# Requests from Com::Nbos::Core::AuthController.
# It will create the request based on Controller request params and 
# send that request to Wavelabs API server and return the response back.
# While sending respose back to receiver it will create the virtual models
# from Com::Nbos::Api::DataModels
class WavelabsClientApi::Client::Api::Core::AuthApi < WavelabsClientApi::Client::Api::Core::BaseApi
  
  # Api Server Authentication End Point URIs
  AUTH_TOKEN_URI       = "/oauth/token"
  TOKEN_VALIDATION_URI = "/api/oauth/v0/tokens"
  LOGIN_URI            = "/api/identity/v0/auth/login"
  LOGOUT_URI           = "/api/identity/v0/auth/logout"
  CHANGE_PASSWORD_URI  = "/api/identity/v0/auth/changePassword"
  FORGOT_PASSWORD_URI  = "/api/identity/v0/auth/forgotPassword"
  RESET_PASSWORD_URI   = "/api/identity/v0/auth/resetPassword"


 
 #Method to get Access Token
 def get_auth_token(grant_type, scope, clientId = nil, clientSecret = nil)
   url_path = base_api_url(AUTH_TOKEN_URI)
   query_params = { :client_id =>  clientId || client_id,
                    :client_secret => clientSecret || client_secret,
                    :grant_type => grant_type,
                    :scope => scope
                  }
   body = nil
   begin                                  
     api_response = send_request('post', url_path, body , query_params)
     details = api_response.code == 200 ? api_response.parsed_response : nil               
     token_model = create_token_model(details)
     build_token_response(api_response, token_model)
   rescue StandardError
     token_model = create_token_model(nil)
     token_model.message = "API Server is Down Please try After Some Time."
     { status: 500, token: token_model}
   end                 
 end

 # Method to validate both client & user token
 def is_token_valid(tokeId, access_token)
   url_path = base_api_url(TOKEN_VALIDATION_URI + "/#{tokeId}")
   api_response = send_request_with_token('get', url_path, access_token)
   details = api_response.code == 200 ? api_response.parsed_response : nil
   token_model = create_token_details_model(details)
   build_token_response(api_response, token_model)
 end 

 def build_token_response(api_response, data_model)
   begin
     if api_response.code == 400
        data_model.add_errors(api_response.parsed_response)
        { status: 400, token: data_model}
     else
        data_model.add_messages(api_response.parsed_response)
        { status: api_response.code, token: data_model}  
     end
   rescue StandardError
     data_model.message = "Internal Server Error Please Try After Some Time."
     { status: 500, token: data_model}
   end    
 end 

 # Api Call to Change Password request with access_token
 def change_password(change_password_params, access_token)
 	 url_path = base_api_url(CHANGE_PASSWORD_URI)
 	 connection_options = { :password =>  change_password_params[:password],
                          :newPassword => change_password_params[:newPassword]
                        }
   login_model = create_login_model(change_password_params)                     
 	 
   api_response = send_request_with_token('post', url_path, access_token, connection_options.to_json)
   
   build_password_response(api_response, login_model) 
 end


 # Api Call to get Reset Password Instructions
 def forgot_password(forgot_password_params, access_token)
 	 url_path = base_api_url(FORGOT_PASSWORD_URI)
 	 connection_options = { :email => forgot_password_params[:email] }
 	 api_response = send_request_with_token('post', url_path, access_token, connection_options.to_json)
   login_model = create_login_model(forgot_password_params)
   
   build_password_response(api_response, login_model)
 end

 def build_password_response(api_response, data_model)
  begin
     if api_response.code == 400
        data_model.add_errors(api_response.parsed_response)
        { status: 400, login: data_model}
     else
        data_model.add_messages(api_response.parsed_response)
        { status: api_response.code, login: data_model}  
     end
   rescue StandardError
     data_model.message = "Internal Server Error Please Try After Some Time."
     { status: 500, login: data_model}
   end
 end 


 # Api Call To Login 
 def login(login_params = nil, access_token = nil)
  login_model = create_login_model(login_params)

  if login_params.present? && check_login_params(login_params)
 	 url_path = base_api_url(LOGIN_URI)
 	 connection_options = { :clientId => client_id, 
 	 	                      :username => login_params[:username], 
 	 	                      :password => login_params[:password]
 	 	                    }

   api_response = send_request_with_token('post', url_path, access_token, connection_options.to_json)

   begin
     if api_response.code == 200
        member_model = create_member_model(api_response.parsed_response, false)
        { status: 200, member: member_model}   
     elsif api_response.code == 400
     	  login_model.add_errors(api_response.parsed_response)
     	  { status: 400, member: nil, login: login_model}
     else
        login_model.add_messages(api_response.parsed_response)
        { status: api_response.code, login: login_model}  
     end
   rescue StandardError
     login_model.message = "Internal Server Error Please Try After Some Time."
     { status: 500, login: login_model}
   end

  else
    login_model.message = "Invalid login parameters"
    { status: 500, login: login_model}
  end  

 end


 # Api Call To Logout with Access Token
 def logout(access_token)
 	 url_path = base_api_url(LOGOUT_URI)
 	 api_response = send_request_with_token('get', url_path, access_token)
   login_model = create_login_model(nil)
   
   begin
     if api_response.code == 200
       login_model.add_messages(api_response.parsed_response)
       {status: 200, login: login_model}
     else
       login_model.add_messages(api_response.parsed_response)
       {status: api_response.code, login: login_model}
     end
   rescue StandardError
     login_model.message = "Internal Server Error Please Try After Some Time."
     { status: 500, login: login_model}
   end  
 end

 
 # Need to Implement this based on Server Side Logic
 def reset_password
 	 url_path = base_api_url(RESET_PASSWORD_URI)
 end


 def check_login_params(login_params)

   if login_params.length == 2 && [:username, :password] == login_params.keys || ["username", "password"] == login_params.keys
     true
   else
     false
   end 
 end 

end	
