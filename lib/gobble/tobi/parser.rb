require "./optprocess"
require "./server"
require "optparse"

module Gobble
  module Tobi
    class Parser
      def parse
        options = {}
        options[:save] = false
        optparse = OptionParser.new do |opts|
          opts.banner = "Usage: gobble -f [full_url] (-s [short_url]) -k [api_key] (--save)\n Options in round brackets are optional\n\n"
          details_full = "-f full_url \t(full_url represents full_url to be shortened)\n"
          details_short = "-s short_url \t(short_url represents custom short link. Optional. If not passed in, a unique one is generated)\n"
          details_key = "-k api_key \t(api_key gotten from user account. Sign up on http://gobble-it.heroku.com for yours.)\n"
          details_save = "--save \t\t(to save api key on this PC.)\n"
          details_help = "-h \t\t(to show this message)\n"
          
          opts.on('-f full_url') do |full_url|
            options[:full_url] = full_url
          end
          
          opts.on('-k key') do |key|
            options[:key] = key
          end
          
          opts.on('--save') do
            options[:save] = true
          end
          
          opts.on('-s short_url') do |short_url|
            options[:short_url] = short_url
          end
          
          opts.on('-h') do
            puts opts.banner << details_full << details_short << details_key << details_save << details_help
            exit
          end
        end
        
        
        begin
          optparse.parse!
        rescue
          puts "Argument(s) not valid. Run gobble -h for instructions."
          exit
        end
        
        Process.new(options).process
      end
    end
  end
end


Gobble::Tobi::Parser.new.parse