# This class is a virtual Model for TokenApiModel.
# It have required attributes to create the TokenApiModel object.


class WavelabsClientApi::Client::Api::DataModels::TokenDetailsApiModel < WavelabsClientApi::Client::Api::DataModels::BaseApiModel
  attr_accessor :username, :clientId, :tokenType, :token, :expiration, :expired, :authorities, :uuid, :tenantId, :message

  def initialize(token_details_params = nil)
  	if token_details_params.present? 
	    @username = token_details_params["username"]
	    @expiration = token_details_params["expiration"]
	    @clientId = token_details_params["clientId"]
	    @token = token_details_params["token"]
	    @tokenType = token_details_params["tokenType"]
      @expired = token_details_params["expired"]
      if token_details_params["member"].present?
        @uuid = token_details_params["member"]["uuid"]
      else
        @uuid = nil 
      end

      if token_details_params["authorities"].present?
        @authorities = token_details_params["authorities"]
      else
        @authorities = nil
      end

      @tenantId = token_details_params["tenantId"]
	  else
	  	@username, @expiration, @clientId, @token, @tokenType, @expired, @authorities, @uuid, @tenantId= nil
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