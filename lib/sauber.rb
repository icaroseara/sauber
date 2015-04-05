require "sauber/version"
require 'sauber/base'

module Sauber extend self
  attr_accessor :whitelist, :blacklist, :replacement

  def configure
   yield self
  end
  
  def clean text
    Sauber::Base.clean text
  end
end
