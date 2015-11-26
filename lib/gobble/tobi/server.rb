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
        uri = URI(FULL_URL + "/api/create")
        uri.query = URI.encode_www_form(values)
        
        res = Net::HTTP.get_response(uri)
        puts res.body if res.is_a?(Net::HTTPSuccess)
      end
    end
    
  end
end