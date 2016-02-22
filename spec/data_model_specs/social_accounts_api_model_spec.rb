require 'spec_helper'

describe WavelabsClientApi::Client::Api::DataModels::SocialAccountsApiModel do

	let (:social_accounts_api_model_obj) { WavelabsClientApi::Client::Api::DataModels::SocialAccountsApiModel.new()}
  let (:social_accounts_api_model) { WavelabsClientApi::Client::Api::DataModels::SocialAccountsApiModel}

  it "#check all model properties" do
    expect(social_accounts_api_model_obj.respond_to?(:id)).to eq true
    expect(social_accounts_api_model_obj.respond_to?(:email)).to eq true
    expect(social_accounts_api_model_obj.respond_to?(:social_type)).to eq true
    expect(social_accounts_api_model_obj.respond_to?(:image_url)).to eq true
  end

  it "#check undefined instance/properties methods" do
    expect(social_accounts_api_model_obj.respond_to?(:password)).to eq false
    expect(social_accounts_api_model_obj.respond_to?(:add_message)).to eq false
  end

  it "#check all instance methods" do
    expect(social_accounts_api_model_obj.respond_to?(:add_errors)).to eq true
    expect(social_accounts_api_model_obj.respond_to?(:add_messages)).to eq true
  end

end	
