# Sauber

A tiny profanity filter.

[![Build Status](https://travis-ci.org/icaroseara/sauber.svg)](https://travis-ci.org/icaroseara/sauber) [![Code Climate](https://codeclimate.com/github/icaroseara/sauber/badges/gpa.svg)](https://codeclimate.com/github/icaroseara/sauber) [![Coverage Status](https://coveralls.io/repos/icaroseara/sauber/badge.svg)](https://coveralls.io/r/icaroseara/sauber)

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'sauber'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install sauber

## Usage

```ruby
Sauber.configure do |config|
  config.blacklist = ["bad", "crime", "war"]
  config.whitelist = ["peace"]
  config.replacement = :stars
end
```

### Blacklist

Words or phrases that you would like to remove.

`config.whitelist` accepts the following values:

- An array with words
- A string representing a path to a yml file

### Whitelist

Phrases that contain a word from the blacklist that you don't wish to remove.

`config.blacklist` accepts the following values:

- An array with words
- A string representing a path to a yml file

### Replacement

`config.replacement` accepts the following values:
- :stars      : Replaces profane words with '*' up to the word's length

### Basic Usage

```ruby
Sauber.sanitize("simple text")
=> "simple text"

Sauber.sanitize("text with shit")
=> "text with $@!#%"
```

## Contributing

1. Fork it ( https://github.com/[my-github-username]/sauber/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
