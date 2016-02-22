module WavelabsClientApi
  module Client
    module Api
      module DataModels
				class BaseApiModel

					include ActiveModel::Validations
					include ActiveModel::Conversion
					extend ActiveModel::Naming

					def create_login_model(login_params)
						  WavelabsClientApi::Client::Api::DataModels::LoginApiModel.new(login_params)
					end

					def create_member_model(json_response, except_token)
					  WavelabsClientApi::Client::Api::DataModels::MemberApiModel.new(json_response, except_token)
					end

					def create_token_model(json_response)
					  WavelabsClientApi::Client::Api::DataModels::TokenApiModel.new(json_response)
					end 

					def create_media_model(json_response)
					  WavelabsClientApi::Client::Api::DataModels::MediaApiModel.new(json_response)	
					end

					def create_message_model(json_response)	
					  WavelabsClientApi::Client::Api::DataModels::MessageApiModel.new(json_response)	
					end

					def create_social_model(json_response)  
					  WavelabsClientApi::Client::Api::DataModels::SocialAccountsApiModel.new(json_response) 
					end

				end 

      end
    end
  end
end
