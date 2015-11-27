require "spec_helper"

describe "Parser" do
  let(:banner)  { "Usage: gobble -f [full_url] (-s [short_url]) -k [api_key] (--save)\n Options in round brackets are optional\n\n" }
  let(:details_full) { "-f full_url \t(full_url represents full_url to be shortened)\n" }
  let(:details_short) { "-s short_url \t(short_url represents custom short link. Optional. If not passed in, a unique one is generated)\n" }
  let(:details_key) { "-k api_key \t(api_key gotten from user account. Sign up on http://gobble-it.heroku.com for yours.)\n" }
  let(:details_save) { "--save \t\t(to save api key on this PC.)\n" }
  let(:details_help) { "-h \t\t(to show this message)\n" }
  let(:full_help) { banner << details_full << details_short << details_key << details_save << details_help }
  let(:right_key) { "6kNm06638zuPYmplv6juCBNeQ2tdu9Q_fo6dmXgyCBFHROB-Xjl4RxWg636ALBY6" }
  let(:right_args) { ["-k", right_key, "-f", "http://developers.gmail.com", "-s", "gmaildeveloper", "--save"] }
  
  describe "Parser#parse" do
    subject do
      Gobble::Tobi::Parser.new
    end
    
    it "raises error when an invalid argument is passed in" do
      expect(STDOUT).to receive(:puts).with("Argument(s) not valid. Run gobble -h for instructions.")
      expect { subject.parse(["-u", "http://gmail.com", "-k", "aldsfkjadlfkajdflkadfs"]) }.to raise_error SystemExit 
    end
    
    it "raises error when an invalid argument is passed in" do
      expect(STDOUT).to receive(:puts).with("Argument(s) not valid. Run gobble -h for instructions.")
      expect { subject.parse(["-u", "http://gmail.com", "-k", "aldsfkjadlfkajdflkadfs"]) }.to raise_error SystemExit 
    end
    
    it "processes correctly when help argument passed" do
      expect(STDOUT).to receive(:puts).with(full_help)
      expect { subject.parse(["-h"]) }.to raise_error SystemExit 
    end
    
    it "processes correctly when all arguments passed" do
      expect(STDOUT).to receive(:puts).with("Link generated successfully. #{Gobble::Tobi::Constants::FULL_URL}/gmaildeveloper")
      subject.parse(right_args) 
    end
    
  end
end
