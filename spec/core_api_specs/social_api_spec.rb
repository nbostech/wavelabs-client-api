require 'spec_helper'

describe WavelabsClientApi::Client::Api::Core::SocialApi do
	let (:social_api_obj) { WavelabsClientApi::Client::Api::Core::SocialApi.new}
  let (:social_api) { WavelabsClientApi::Client::Api::Core::SocialApi}

  it "#check_connection?" do
    expect(social_api.check_connection?).to be true
  end 

  it "#Check Constants of Social API URIS" do
  	expect(social_api::FACEBOOK_LOGIN_URI).to eq '/api/identity/v0/auth/social/facebook/connect'
    expect(social_api::GOOGLE_LOGIN_URI).to eq '/api/identity/v0/auth/social/googlePlus/connect'
    expect(social_api::GITHUB_LOGIN_URI).to eq '/api/identity/v0/auth/social/gitHub/connect'
    expect(social_api::LINKEDIN_LOGIN_URI).to eq '/api/identity/v0/auth/social/linkedIn/connect'
    expect(social_api::INSTAGRAM_LOGIN_URI).to eq '/api/identity/v0/auth/social/instagram/connect'
    expect(social_api::TWITER_LOGIN_URI).to eq '/api/identity/v0/auth/social/twitter/connect'
    expect(social_api::INVALID_SOCIAL_URI).to eq '/api/identity/v0/auth/social/invalid/connect'
  end

  it "#get_scoial_login_uri" do
  	expect(social_api_obj.get_scoial_login_uri("facebook")).to eq '/api/identity/v0/auth/social/facebook/connect'
  	expect(social_api_obj.get_scoial_login_uri("google_oauth2")).to eq '/api/identity/v0/auth/social/googlePlus/connect'
  	expect(social_api_obj.get_scoial_login_uri("linkedin")).to eq '/api/identity/v0/auth/social/linkedIn/connect'
  	expect(social_api_obj.get_scoial_login_uri("instagram")).to eq '/api/identity/v0/auth/social/instagram/connect'
  	expect(social_api_obj.get_scoial_login_uri("twitter")).to eq '/api/identity/v0/auth/social/twitter/connect'
  	expect(social_api_obj.get_scoial_login_uri("github")).to eq '/api/identity/v0/auth/social/gitHub/connect'
    expect(social_api_obj.get_scoial_login_uri("abcdef")).to eq '/api/identity/v0/auth/social/invalid/connect'
  end	


end	