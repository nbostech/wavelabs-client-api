require 'bundler/setup'
Bundler.setup

require 'active_model'
require 'wavelabs_client_api' 
require 'byebug'

require 'support/user_sign_up.rb'

# and any other gems you need

### WaveLabs Server Details 
ENV['API_HOST_URL']  = 'http://localhost:8080/starter-app-rest-grails'
ENV['API_CLIENT_KEY'] = 'my-client'
ENV['API_CLIENT_SECRET'] = 'my-secret' 

RSpec.configure do |config|
  # some (optional) config here
end

WavelabsClientApi.configure do |config|
  config.api_host_url = ENV['API_HOST_URL']
  config.client_key = ENV['API_CLIENT_KEY']
  config.client_secret = ENV['API_CLIENT_SECRET']
end