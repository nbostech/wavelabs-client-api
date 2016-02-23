require 'spec_helper'

describe WavelabsClientApi::Client::Api::Core::UsersApi do

  let (:user_api_obj) { WavelabsClientApi::Client::Api::Core::UsersApi.new}
  let (:user_api) { WavelabsClientApi::Client::Api::Core::UsersApi}
  let(:get_initial_token) {UserSignUp.get_token}

  let(:login_user) {UserSignUp.login_user}
  
  it "check server connection" do
    expect(user_api.check_connection?).to be true
  end 

  
  it "#Check Constants of Users API URIS" do
    expect(user_api::SIGNUP_URI).to eq '/api/v0/users/signup'
    expect(user_api::USER_URI).to eq '/api/v0/users'
  end


  it "Signup with existing user details(#sign_up)" do
    user_params = {:username => "wavlelabstest", 
                          :password => "test123",
                          :email => "test@wavelabs.com",
                          :firstName => "w",
                          :lastName => "L"}

    res = user_api_obj.sign_up(user_params, get_initial_token)
    expect(res[:status]).to eq 400
    expect(res[:member].errors.size).to eq 2

  end

  it "Signup with valid details(#sign_up)" do
    random_number = rand(0..100)
    user_params = {:username => "wavlelabstest#{random_number}", 
                          :password => "test1234",
                          :email => "test@wavelabs#{random_number}.com",
                          :firstName => "L",
                          :lastName => "W"}

    res = user_api_obj.sign_up(user_params, get_initial_token)
    expect([200,400].include?res[:status]).to eq true
  end

  it "After Login user can view his profile(#show)" do
    l_req = login_user
    res = user_api_obj.show({:id => l_req[:member].id},l_req[:member].token.value.first)
    expect(res[:status]).to eq 200
  end

  it "After Login user can update his profile(#update)" do
    l_req = login_user
    edit_user_params = {:id => l_req[:member].id, 
                        :description => "test wavelabs",
                        :email => "test@wavelabs.com",
                        :firstName => "W",
                        :lastName => "L"
                       }
    res = user_api_obj.update(edit_user_params,l_req[:member].token.value.first)
    expect(res[:status]).to eq 200
  end
  	
end