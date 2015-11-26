require 'spec_helper'

describe "Server" do
  
  let(:values_wrong) { {key: "asdlfa", full_url: "http://gmail.com", short_url: "gmailsite" } }
  let(:values_right) { {key: "asdlfa", full_url: "http://gmail.com", short_url: "gmailsite" } }
  
  let(:subject_wrong) { Gobble::Tobi::ServerGateway.new(:values_wrong) }
  let(:subject_right) { Gobble::Tobi::ServerGateway.new(:values_right) }
  
  describe "Server#initialize" do
    it "initializes correctly" do
      expect(subject_wrong).to be_a Gobble::Tobi::ServerGateway
    end
  end
  
  describe "Server#communicate" do
    
  end
end
