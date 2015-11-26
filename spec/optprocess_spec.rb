require 'spec_helper'

describe "Opt Process" do
  let(:file_name) { "gobble_api_key.gb" }
  let(:key) { "testkey" }
  describe "Process#save_key" do
    context "when there's no key, and save is specified" do
      let(:options) { { save: true, long_url: "http://trialtest.com" } }
      subject do
        Gobble::Tobi::Process.new(options)
      end
      
      it "raises an error and exits" do
        expect(STDOUT).to receive(:puts).with("Save Error. Key argument required! Run gobble -h to view options")
        expect{subject.save_key(options, {})}.to raise_error SystemExit
      end
    end
  
  
    context "when there's a key, and save is specified" do
      let(:options) { { save: true, long_url: "http://trialtest.com", key: key } }
      subject do
        Gobble::Tobi::Process.new(options)
      end
      
      it "saves key to a new file" do
        subject.save_key(options, subject.values)
        expect(File).to exist(file_name)
      end
    end
  end

  describe "Process#store_key" do
    context "when key is passed in, store appropriately" do
      let(:options) { { save: true, long_url: "http://trialtest.com",  key: key } }
      subject do
        Gobble::Tobi::Process.new(options)
      end
      
      it "stores key to values hash" do
        subject.store_key(options, subject.values)
        expect(subject.values).to include(key: key)
      end
    end
    
    context "uses stored key if no key passed in" do
      let(:options) { { save: true, long_url: "http://trialtest.com" } }
      subject do
        Gobble::Tobi::Process.new(options)
      end
      
      it "uses existing key when there's a stored key and no key passed in" do
        subject.store_key(options, subject.values)
        expect(subject.values).to include(key: key)
      end
      
      it "raises error if no stored key" do
        File.delete(file_name)
        expect(STDOUT).to receive(:puts).with("No key found! Key argument required. Run gobble -h to view options")
        expect{subject.store_key(options, subject.values)}.to raise_error SystemExit
      end
    end
  end
  
end
