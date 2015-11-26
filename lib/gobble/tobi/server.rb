require "net/http"
require "gobble/tobi/constants"

module Gobble
  module Tobi
    class ServerGateway
      include Gobble::Tobi::Constants
      
      attr_accessor :values
      
      def initialize(values)
        @values = values
      end
      
      def communicate
        actual_response = nil
        uri = URI(FULL_URL + "/api/create")
        uri.query = URI.encode_www_form(values)
        
        res = Net::HTTP.get_response(uri)
        if res.is_a?(Net::HTTPSuccess)
          actual_response = res.body
        end
        puts actual_response 
      end
    end
    
  end
end