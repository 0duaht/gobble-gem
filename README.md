# Gobble-Gem
[![Code Climate](https://codeclimate.com/github/andela-toduah/gobble-gem/badges/gpa.svg)](https://codeclimate.com/github/andela-toduah/gobble-gem) [![Test Coverage](https://codeclimate.com/github/andela-toduah/gobble-gem/badges/coverage.svg)](https://codeclimate.com/github/andela-toduah/gobble-gem/coverage)

## Features
Ruby gem to interface with the Gobble-It API. API available at http://gobble-it.herokuapp.com.
It allows you create URLs by passing in parameters while running the gem.

## Limitations
Currently, the gem only allows you create URLs. It does not let you obtain your user details or any other information.

## Installation

To install, execute:

    $ gem install gobble

## Usage

    $ gobble -f [full_url] (-s [short_url]) -k [api_key] (--save)
    
Options in round brackets are optional.

-f full_url     (full_url represents full_url to be shortened)

-s short_url    (short_url represents custom short link. Optional. If not passed in, a unique one is generated)

-k api_key      (api_key gotten from user account. Sign up on http://gobble-it.heroku.com for yours.)

--save          (to save api key on your PC.)

-h              (to show help message)
    
## Testing

To test the application, run the following command to carry out all tests:

        $ bundle exec rake spec

To view test descriptors, run the following command:

        $ bundle exec rake spec -fd

## Contributing

1. Fork it by visiting - https://github.com/andela-toduah/gobble-gem/fork

2. Create your feature branch

        $ git checkout -b new_feature
    
3. Contribute to code

4. Commit changes made

        $ git commit -a -m 'descriptive_message_about_change'
    
5. Push to branch created

        $ git push origin new_feature
    
6. Then, create a new Pull Request
