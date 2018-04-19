# CAPostalCode
Guesses the Canadian province or territory (*region*) based on the postal code.

For provinces and Yukon, it will guess based on the first letter. For Northwest Territories and Nunavut, it will check the first two or three characters.

## Usage
### Validity
```ruby
CAPostalCode.valid?("h1b2p3")
# => true

CAPostalCode.valid?("F8G 1A1")
# => false

CAPostalCode.valid?("potato")
# => false

CAPostalCode.valid?("P0T 4T0")
# => true
```

### Normalization
```ruby
CAPostalCode.normalize("e3b.4k5 ")
# => "E3B 4K5"

CAPostalCode.normalize("g1c 4z9")
# => "G1C 4Z9"
```

### Region guessing
```ruby
CAPostalCode.guess_region("G1A 1A1")
# => "QC"

CAPostalCode.guess_region("X0C 1A1")
# => "NU"

CAPostalCode.guess_region("B6A 1A1")
# => "NS"
```

## Installation
In your Gemfile:

    gem "ca_postal_code"

Or install it yourself:

    $ gem install ca_postal_code

## Development
After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing
Bug reports and pull requests are welcome on GitHub at https://github.com/joallard/ca-postal-code.
