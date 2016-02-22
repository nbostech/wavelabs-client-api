require 'spec_helper'

describe WavelabsClientApi::Client::Api::DataModels::MemberApiModel do

	let (:member_api_model_obj) { WavelabsClientApi::Client::Api::DataModels::MemberApiModel.new(nil, true)}
  let (:member_api_model_obj_with_associates) { WavelabsClientApi::Client::Api::DataModels::MemberApiModel.new(nil, false)}
  let (:member_api_model) { WavelabsClientApi::Client::Api::DataModels::MemberApiModel}

  it "#check all model properties" do
    expect(member_api_model_obj.respond_to?(:username)).to eq true
    expect(member_api_model_obj.respond_to?(:email)).to eq true
    expect(member_api_model_obj.respond_to?(:firstName)).to eq true
    expect(member_api_model_obj.respond_to?(:lastName)).to eq true
    expect(member_api_model_obj.respond_to?(:phone)).to eq true
    expect(member_api_model_obj.respond_to?(:id)).to eq true
    expect(member_api_model_obj.respond_to?(:description)).to eq true
    expect(member_api_model_obj.respond_to?(:message)).to eq true
  end

  it "#check all instance methods" do
    expect(member_api_model_obj.respond_to?(:add_errors)).to eq true
    expect(member_api_model_obj.respond_to?(:add_messages)).to eq true
  end

  it "#check undefined instance/properties methods" do
    expect(member_api_model_obj.respond_to?(:password)).to eq false
    expect(member_api_model_obj.respond_to?(:add_message)).to eq false
  end


  it "#check assoicated models of member" do
    m_model = member_api_model_obj_with_associates

    expect(m_model.respond_to?(:social_accounts)).to eq true
    expect(m_model.respond_to?(:token)).to eq true
  end

end	
