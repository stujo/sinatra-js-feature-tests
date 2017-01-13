require 'rack/test'

require_relative '../8ball.rb'

def app
  Sinatra::Application
end

require_relative './capybara_helper'

RSpec.configure do |config|
  require_relative './database_cleaner_helper'
  configure_database_cleaner(config)

  config.include Rack::Test::Methods

  config.expect_with :rspec do |expectations|
    expectations.include_chain_clauses_in_custom_matcher_descriptions = true
  end

  config.mock_with :rspec do |mocks|
    mocks.verify_partial_doubles = true
  end

  config.profile_examples = 10
  config.order = :random
  Kernel.srand config.seed
end
