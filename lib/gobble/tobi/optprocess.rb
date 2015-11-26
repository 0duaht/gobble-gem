require "gobble/tobi/constants"
require "gobble/tobi/server"

module Gobble
  module Tobi
    class Process
      include Gobble::Tobi::Constants
      
      attr_accessor :options
      attr_accessor :values
      
      def initialize(options)
        @options = options
        @values = {}
      end
      
      def process
        save_key(options, values)
        store_key(options, values)
        store_url(options, values)
        
        puts Gobble::Tobi::ServerGateway.new(values).communicate
      end
      
      def save_key(options, values)
        if options[:save]
          if options[:key]
            File.open(FILE_NAME, "w+") { |file| file.write(options[:key]) }
          else
            puts "Save Error. Key argument required! Run gobble -h to view options"
            exit
          end
        end
      end
      
      def store_key(options, values)
        if options[:key]
          values[:key] = options[:key]
        else
          if File.exist?(FILE_NAME)
            values[:key] = File.open(FILE_NAME, "r") { |file| file.read(options[:key]) }
          else
            puts "No key found! Key argument required. Run gobble -h to view options"
            exit
          end
        end
      end
      
      def store_url(options, values)
        if options[:full_url]
          values[:full_url] = options[:full_url]
        else
          puts "Full URL argument required. Run gobble -h to view options"
          exit
        end
        
        if options[:short_url]
          values[:short_url] = options[:short_url]
        end
      end
      
    end
  end
end