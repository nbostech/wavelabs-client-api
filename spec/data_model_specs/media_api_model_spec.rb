require 'spec_helper'

describe WavelabsClientApi::Client::Api::DataModels::MediaApiModel do

	let (:media_api_model_obj) { WavelabsClientApi::Client::Api::DataModels::MediaApiModel.new()}
  let (:media_api_model) { WavelabsClientApi::Client::Api::DataModels::MediaApiModel}

  it "#check all model properties" do
    expect(media_api_model_obj.respond_to?(:extension)).to eq true
    expect(media_api_model_obj.respond_to?(:mediaFileDetailsList)).to eq true
    expect(media_api_model_obj.respond_to?(:newMedia)).to eq true
    expect(media_api_model_obj.respond_to?(:supportedsizes)).to eq true
    expect(media_api_model_obj.respond_to?(:message)).to eq true
  end

  it "#check undefined instance/properties methods" do
    expect(media_api_model_obj.respond_to?(:password)).to eq false
    expect(media_api_model_obj.respond_to?(:add_message)).to eq false
  end

end	
