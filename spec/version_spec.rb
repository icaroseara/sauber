require 'spec_helper'

describe Sauber do
  describe "Version" do
    it 'has a version number' do
      expect(Sauber::VERSION).not_to be nil
    end
  end
end
