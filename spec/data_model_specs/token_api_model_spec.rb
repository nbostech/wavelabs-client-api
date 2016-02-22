require 'spec_helper'

describe WavelabsClientApi::Client::Api::DataModels::TokenApiModel do

	let (:token_api_model_obj) { WavelabsClientApi::Client::Api::DataModels::TokenApiModel.new()}
  let (:token_api_model) { WavelabsClientApi::Client::Api::DataModels::TokenApiModel}

  it "#check all model properties" do
    expect(token_api_model_obj.respond_to?(:value)).to eq true
    expect(token_api_model_obj.respond_to?(:expires_in)).to eq true
    expect(token_api_model_obj.respond_to?(:refresh_token)).to eq true
    expect(token_api_model_obj.respond_to?(:token_type)).to eq true
    expect(token_api_model_obj.respond_to?(:scope)).to eq true
  end

  it "#check undefined instance/properties methods" do
    expect(token_api_model_obj.respond_to?(:password)).to eq false
    expect(token_api_model_obj.respond_to?(:add_message)).to eq false
  end

end	
