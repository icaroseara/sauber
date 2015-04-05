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

      describe "replace profane words" do
        it{ expect(Sauber.clean("Hello war")).to eq("Hello ***") }  
      end
      
      describe "replace profane words in caps" do
        it{ expect(Sauber.clean("Hello WAR")).to eq("Hello ***") }          
      end
      
      describe "replace punctuation spaced profane words" do
        it{ expect(Sauber.clean("Hello W.A.R")).to eq("Hello ***") }      
        it{ expect(Sauber.clean("Hello W-A-R")).to eq("Hello ***") }              
      end
      
      describe "doens't replace special caracters" do
        it{ expect(Sauber.clean("WAR?!")).to eq("***?!") }          
      end
      
      describe "doens't modify clean words" do
        it{ expect(Sauber.clean("hello  world")).to eq("hello  world") }     
      end
      
      describe "doens't modify whitespaces" do
        it{ expect(Sauber.clean("hello   world")).to eq("hello   world") }     
      end
      
      describe "doens't modify empty word" do
        it{ expect(Sauber.clean("")).to eq("") }          
      end
    end
    
    context "with whitelist" do
      describe "replace profane words" do
        it{ expect(Sauber.clean("Hello war")).to eq("Hello ***") }  
      end
      
      describe "replace profane words in caps" do
        it{ expect(Sauber.clean("Hello WAR")).to eq("Hello ***") }          
      end
      
      describe "replace punctuation spaced profane words" do
        it{ expect(Sauber.clean("Hello W.A.R")).to eq("Hello ***") }      
        it{ expect(Sauber.clean("Hello W-A-R")).to eq("Hello ***") }              
      end
      
      describe "doens't replace special caracters" do
        it{ expect(Sauber.clean("WAR?!")).to eq("***?!") }          
      end
      
      describe "doens't modify clean words" do
        it{ expect(Sauber.clean("hello  world")).to eq("hello  world") }     
      end
      
      describe "doens't modify whitespaces" do
        it{ expect(Sauber.clean("hello   world")).to eq("hello   world") }     
      end
      
      describe "doens't modify empty word" do
        it{ expect(Sauber.clean("")).to eq("") }          
      end
    end  
  end
end
