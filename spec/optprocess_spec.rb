require 'spec_helper'

describe "Opt Process" do
  let(:file_name) { "gobble_api_key.gb" }
  let(:key) { "testkey" }
  let(:short) { "testshort" }
  let(:url) { "http://trialtest.com" }
  
  describe "Process#initialize" do
    let(:options) { { save: true, full_url: url, short_url: short, key: key } }
    subject do
      Gobble::Tobi::Process.new(options)
    end
    
    it "instantiates correctly" do
      expect(subject).to be_a Gobble::Tobi::Process
    end
  end
  
  describe "Process#save_key" do
    context "when there's no key, and save is specified" do
      let(:options) { { save: true, full_url: url } }
      subject do
        Gobble::Tobi::Process.new(options)
      end
      
      it "raises an error and exits" do
        expect(STDOUT).to receive(:puts).with("Save Error. Key argument required! Run gobble -h to view options")
        expect{subject.save_key(options, subject.values)}.to raise_error SystemExit
      end
    end
  
  
    context "when there's a key, and save is specified" do
      let(:options) { { save: true, full_url: url, key: key } }
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
      let(:options) { { save: true, full_url: url,  key: key } }
      subject do
        Gobble::Tobi::Process.new(options)
      end
      
      it "stores key to values hash" do
        subject.store_key(options, subject.values)
        expect(subject.values).to include(key: key)
      end
    end
    
    context "uses stored key if no key passed in" do
      let(:options) { { save: true, full_url: url } }
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
  
  describe "Process#store_url" do
    context "when there's no full url passed in" do
      let(:options) { { key: key } }
      subject do
        Gobble::Tobi::Process.new(options)
      end
      
      it "raises an error and exits" do
        expect(STDOUT).to receive(:puts).with("Full URL argument required. Run gobble -h to view options")
        expect{subject.store_url(options, subject.values)}.to raise_error SystemExit
      end
    end
  
  
    context "when full url is passed in" do
      let(:options) { { save: true, full_url: url, key: key } }
      subject do
        Gobble::Tobi::Process.new(options)
      end
      
      it "saves full url" do
        subject.store_url(options, subject.values)
        expect(subject.values).to include(full_url: url)
      end
    end
    
    context "when short url is also passed in" do
      let(:options) { { save: true, full_url: url, short_url: short, key: key } }
      subject do
        Gobble::Tobi::Process.new(options)
      end
      
      it "saves short url" do
        subject.store_url(options, subject.values)
        expect(subject.values).to include(short_url: short)
      end
    end
  end
  
  # describe "Process#process" do
    # let(:options) { { save: true, full_url: url, short_url: short, key: key } }
    # subject do
      # Gobble::Tobi::Process.new(options)
    # end
#     
    # it "goes smoothly when args are correct" do
      # subject.process
    # end
  # end
  
end
