# This class is a virtual Model for TokenApiModel.
# It have required attributes to create the TokenApiModel object.


class WavelabsClientApi::Client::Api::DataModels::TokenApiModel < WavelabsClientApi::Client::Api::DataModels::BaseApiModel
  attr_accessor :value, :expires_in, :refresh_token, :scope, :token_type, :message

  def initialize(token_params = nil)
  	if token_params.present? 
	    @value = token_params["access_token"]
	    @expires_in = token_params["expires_in"]
	    @refresh_token = token_params["refresh_token"]
	    @scope = token_params["scope"]
	    @token_type = token_params["token_type"]
	  else
	  	@value , @expires_in, @refresh_token, @scope, @token_type, @message = nil
	  end    
  end

  def add_errors(json_response)
    json_response["errors"].each do |e| 
      property_name = e['propertyName']
      msg = e['message']  
      self.errors[property_name] << msg
    end   
  end

  def add_messages(json_response)
    if json_response["message"].present?
      @message = json_response["message"]
    elsif json_response["error"].present?
      @message = json_response["error"]
    end  
          
  end

end