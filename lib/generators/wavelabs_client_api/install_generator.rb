module WavelabsClientApi
  module Generators
    class InstallGenerator < Rails::Generators::Base
      source_root File.expand_path("../../templates", __FILE__)
      desc "Creates wavelabs client api initializer for your application"

      def copy_initializer
        template "wavelabs_client_api_initializer.rb", "config/initializers/wavelabs_client_api.rb"

        puts "Install complete! Please make sure to set following ENV variables!"
        puts "ENV['API_HOST_URL'] = 'site url' "
        puts "ENV['CLIENT_ID'] = 'XXXXXX'"
        puts "ENV['CLIENT_SECRET'] = 'XXXXXXXXX' "
      end
    end
  end
end