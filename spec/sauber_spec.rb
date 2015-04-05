require 'spec_helper'

describe Sauber do
  before do
    Sauber.configure do |config|
      config.blacklist = ["bad", "crime", "war"]
      config.whitelist = ["peace"]
      config.replacement = :stars
    end
  end
  
  describe ".sanitize" do 
    context "without whitelist" do
      before { Sauber.whitelist = [] }
      describe "basic profanity filter" do
        it{ expect("Hello world").to eq(Sauber.sanitize("Hello world")) }   
        it{ expect("Hello ***").to eq(Sauber.sanitize("Hello war")) }   
      end
    end
    
    context "with whitelist" do
    end  
  end
end
