require 'spec_helper'

describe WavelabsClientApi::Client::Api::DataModels::MessageApiModel do

	let (:message_api_model_obj) { WavelabsClientApi::Client::Api::DataModels::MessageApiModel.new()}
  let (:message_api_model) { WavelabsClientApi::Client::Api::DataModels::MessageApiModel}

  it "#check all model properties" do
    expect(message_api_model_obj.respond_to?(:status)).to eq true
    expect(message_api_model_obj.respond_to?(:messgeCode)).to eq true
    expect(message_api_model_obj.respond_to?(:message)).to eq true
  end

  it "#check undefined instance/properties methods" do
    expect(message_api_model_obj.respond_to?(:password)).to eq false
    expect(message_api_model_obj.respond_to?(:add_message)).to eq false
  end

end	
