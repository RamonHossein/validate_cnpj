# ValidateCnpj

[![Gem Version](https://badge.fury.io/rb/validate_cnpj.png)](http://badge.fury.io/rb/validate_cnpj)
[![Coverage Status](https://coveralls.io/repos/github/RamonHossein/validate_cnpj/badge.svg)](https://coveralls.io/github/RamonHossein/validate_cnpj)
[![Build Status](https://secure.travis-ci.org/RamonHossein/validate_cnpj.png?branch=master)](http://travis-ci.org/RamonHossein/validate_cnpj)

Para ler esta documentação em português click [aqui](https://github.com/RamonHossein/validate_cnpj/blob/master/LEIAME.md).

Adds CNPJ validation support to Rails (ActiveModel) and test it in a simple way.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'validate_cnpj'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install validate_cnpj

## Usage

Just use as any other validator:

```ruby
class User < ActiveRecord::Base
    validates :cnpj, cnpj: true
end
```

## Error Message

If you need to localize the error message, just add this to your I18n locale file:

```ruby
errors:
  messages:
    this_document_is_invalid: "This document is invalid"
```

You can provide your own message using :message option.

```ruby
validates :cnpj, cnpj: {message: "new error message"}
```

## Mantainers
[RamonHossein](https://github.com/RamonHossein)

## Contributors

To see the generous people who have contributed code, take a look at the [contributors list](http://github.com/RamonHossein/validate_cnpj/contributors).

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Added some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request

## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).
