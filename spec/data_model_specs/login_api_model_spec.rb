require 'spec_helper'

describe WavelabsClientApi::Client::Api::DataModels::LoginApiModel do

	let (:login_api_model_obj) { WavelabsClientApi::Client::Api::DataModels::LoginApiModel.new}
  let (:login_api_model) { WavelabsClientApi::Client::Api::DataModels::LoginApiModel}

  it "#check all model properties" do
    expect(login_api_model_obj.respond_to?(:username)).to eq true
    expect(login_api_model_obj.respond_to?(:email)).to eq true
    expect(login_api_model_obj.respond_to?(:firstName)).to eq true
    expect(login_api_model_obj.respond_to?(:lastName)).to eq true
    expect(login_api_model_obj.respond_to?(:phone)).to eq true
    expect(login_api_model_obj.respond_to?(:newPassword)).to eq true
    expect(login_api_model_obj.respond_to?(:message)).to eq true
  end

  it "#check all instance methods" do
    expect(login_api_model_obj.respond_to?(:add_errors)).to eq true
    expect(login_api_model_obj.respond_to?(:add_messages)).to eq true
  end

  it "#check undefined instance/properties methods" do
    expect(login_api_model_obj.respond_to?(:description)).to eq false
    expect(login_api_model_obj.respond_to?(:add_message)).to eq false
  end
end	
