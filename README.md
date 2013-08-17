# Rivets::Rails

[rivets](https://github.com/mikeric/rivets) plugin for Rails

## Installation

Add this line to your application's Gemfile:

    gem 'rivets-rails'

## Usage

Add the following to your `app/assets/javascripts/application.js` file.

    //= require rivets
    //= require rivets.general_custom

### Binders

content

    TODO

color

    <span data-color="model.color">COLOR</span>

### Formatters

shortdate, number, string, negate, eq, not_eq, gt, lt, blank, preventDefault

Examples, please Read [rivets wiki](https://github.com/mikeric/rivets/wiki/Example-formatters)

length

    data-length="model.foo | length"

mask

    data-text="billing.cardNumber | mask 4 4 ********"



