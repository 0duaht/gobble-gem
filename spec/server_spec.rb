require 'spec_helper'

describe "Server" do
  let(:right_key) { "6kNm06638zuPYmplv6juCBNeQ2tdu9Q_fo6dmXgyCBFHROB-Xjl4RxWg636ALBY6" }
  let(:wrong_key) { "keyhack" }
  
  let(:values_no_key) { { full_url: "http://gmail.com" } }
  let(:values_wrong_key) { { key: wrong_key, full_url: "http://gmail.com", short_url: "gmailsite" } }
  let(:values_no_short) { {key: right_key, full_url: "http://gmail.com" } }
  let(:values_no_long) { {key: right_key } }
  let(:values_all) { {key: right_key, full_url: "http://gmail.com", short_url: "gmailsite" } }
  
  let(:subject_no_key) { Gobble::Tobi::ServerGateway.new(values_no_key) }
  let(:subject_wrong_key) { Gobble::Tobi::ServerGateway.new(values_wrong_key) }
  let(:subject_no_short) { Gobble::Tobi::ServerGateway.new(values_no_short) }
  let(:subject_no_long) { Gobble::Tobi::ServerGateway.new(values_no_long) }
  let(:subject_all) { Gobble::Tobi::ServerGateway.new(values_all) }
  
  describe "Server#initialize" do
    it "initializes correctly" do
      expect(subject_no_key).to be_a Gobble::Tobi::ServerGateway
    end
  end
  
  describe "Server#communicate" do
    it "communicates correctly with no key" do
      expect(subject_no_key.communicate).to eql("Invalid Entry. URL parameter(s) missing.")
    end
    
    it "communicates correctly with wrong key" do
      expect(subject_wrong_key.communicate).to eql("Authentication failed. Invalid API key.")
    end
    
    it "communicates correctly with no short url" do
      expect(subject_no_short.communicate).to include("Link generated successfully")
    end
    
    it "communicates correctly with no long url" do
      expect(subject_no_long.communicate).to eql("Invalid Entry. URL parameter(s) missing.")
    end
    
    it "communicates correctly with valid fields" do
      expect(subject_all.communicate).to include("Link generated successfully. #{Gobble::Tobi::Constants::FULL_URL}/gmailsite")
    end
  end
end
