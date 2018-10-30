require 'rubocop'
require 'rubocop/rspec/support'
require 'rubocop-predix_ci'

RSpec.configure do |config|
  config.include RuboCop::RSpec::ExpectOffense

  config.disable_monkey_patching!
  config.order = :random
end
