require 'capybara/rspec'
require 'rspec'
require 'rack/test'
require 'capybara'
require 'sinatra'
require 'simplecov'
require 'simplecov-console'
require 'pg'
require_relative './setup_test_database'

ENV['ENVIRONMENT'] = 'test'



SimpleCov.formatter = SimpleCov::Formatter::MultiFormatter.new([
  SimpleCov::Formatter::Console,
  # Want a nice code coverage website? Uncomment this next line!
  # SimpleCov::Formatter::HTMLFormatter
])
SimpleCov.start

require File.join(File.dirname(__FILE__), '..', 'app.rb')
require File.join(File.dirname(__FILE__), 'web_helpers.rb')

Capybara.app = BookmarkManager


RSpec.configure do |config|

  config.before(:each) do
    setup_test_database
  end

  config.expect_with :rspec do |expectations|

    expectations.include_chain_clauses_in_custom_matcher_descriptions = true
  end


  config.mock_with :rspec do |mocks|

    mocks.verify_partial_doubles = true
  end

  config.shared_context_metadata_behavior = :apply_to_host_groups


end
