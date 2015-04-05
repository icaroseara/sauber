# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'sauber/version'

Gem::Specification.new do |spec|
  spec.name          = "sauber"
  spec.version       = Sauber::VERSION
  spec.authors       = ["Icaro Seara"]
  spec.email         = ["icaro.seara@gmail.com"]
  spec.homepage      = 'https://github.com/icaroseara/sauber'
  spec.summary       = 'A tiny profanity filter.'
  spec.description   = 'A tiny profanity filter that use blacklist, whitelist and sanitization rules to clean up profanity in text.'
  spec.license       = "MIT"
  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.9"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec"
  spec.add_development_dependency "rspec-nc"
  spec.add_development_dependency "pry"
  spec.add_development_dependency "pry-remote"
  spec.add_development_dependency "pry-nav"
  spec.add_development_dependency "coveralls"
  spec.add_development_dependency "codeclimate-test-reporter"
end
