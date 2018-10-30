# RuboCop PredixCi

PredixCi RuboCop extension.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'rubocop-predix_ci'
```

And then execute:

    $ bundle

## Usage

Configure RuboCop to load the extension in `.rubocop.yml`.

```ruby
require: rubocop-predix_ci
```

## The Cops

All cops are located under
[`lib/rubocop/cop/predix_ci`](lib/rubocop/cop/predix_ci).
All cops are enabled by default.

In your `.rubocop.yml`, you may treat the PredixCi cops just like any other
cop. For example:

```yaml
PredixCi/NotUnless:
  Enabled: false
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.
