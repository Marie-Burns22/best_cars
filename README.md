# BestCars

This program will scrape the fueleconomy.gov website to list the top 8 most fuel efficient cars by EPA class. It then asks the user to select a car for more information.  After the program returns information from the first level of the website, it asks the user if they would like additional information from another page about the fuel economy. The user can also select another car either after the first set of data is returned or after the additional data is returned.  If the user does not select a new car to view, the program exits. 

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'best_cars'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install best_cars

## Usage

To start the program, run ruby bin/best_cars. This will start the program and give you a list of cars.  Follow the prompts to select specific cars and request information about them. After information is listed, there will be a prompt asking if the user would like to select another car. The user can exit the program by inputing no.

## Development

After checking out the repo, run `bin/setup` to install dependencies. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/'Ceci2222'/best_cars. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the BestCars project’s codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/'Ceci2222'/best_cars/blob/master/CODE_OF_CONDUCT.md).
