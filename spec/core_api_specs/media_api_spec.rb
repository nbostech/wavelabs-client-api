require 'spec_helper'

describe WavelabsClientApi::Client::Api::Core::MediaApi do
	let(:login_user) {UserSignUp.login_user}

	let (:media_api_obj) { WavelabsClientApi::Client::Api::Core::MediaApi.new}
  let (:media_api) { WavelabsClientApi::Client::Api::Core::MediaApi}

  it "#check_connection?" do
    expect(media_api.check_connection?).to be true
  end

  it "#Check Constants of Media API URIS" do
    expect(media_api::MEDIA_URI).to eq '/api/media/v0/media'
  end

  it "#get_media with user details after login" do
  	l_req = login_user
  	res = media_api_obj.get_media(l_req[:member].id, "profile", l_req[:member].token.value)
    expect(res[:status]).to eq 200
  end

  it "#update_media with user details after login" do
  	l_req = login_user
  	file_path = Dir.pwd + "/spec/support/temp_user.png"
  	res = media_api_obj.upload_media(file_path, "profile", l_req[:member].token.value, l_req[:member].id)
    expect(res[:status]).to eq 200
  end

  it "#update_media with invalide file type after login" do
  	l_req = login_user
  	file_path = Dir.pwd + "/spec/support/temp_user.doc"
  	res = media_api_obj.upload_media(file_path, "profile", l_req[:member].token.value, l_req[:member].id)
    expect(res[:status]).to eq 200
    expect(res[:media].message).to eq "media.upload.error"
  end		

end	
