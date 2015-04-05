$LOAD_PATH.unshift File.expand_path('../../lib', __FILE__)
require 'coveralls'
require "codeclimate-test-reporter"
require 'pry'
require 'sauber'
Coveralls.wear!
CodeClimate::TestReporter.start


