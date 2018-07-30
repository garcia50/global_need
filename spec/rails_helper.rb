require 'database_cleaner'

require 'spec_helper'
ENV['RAILS_ENV'] ||= 'test'
require File.expand_path('../../config/environment', __FILE__)
abort("The Rails environment is running in production mode!") if Rails.env.production?
require 'rspec/rails'

ActiveRecord::Migration.maintain_test_schema!
RSpec.configure do |config|
  #config.include FactoryBot::Syntax::Methods !!!!!!ONLY USE THIS LINE IF YOU PLAN ON USING SHOULDA MATCHERS!!!!!!
  config.fixture_path = "#{::Rails.root}/spec/fixtures"
  config.use_transactional_fixtures = true
  config.infer_spec_type_from_file_location!
  config.filter_rails_from_backtrace!
end

DatabaseCleaner.strategy = :truncation

RSpec.configure do |c|
  c.before(:all) do
    DatabaseCleaner.clean
  end

  c.after(:each) do
    DatabaseCleaner.clean
  end

  c.include Capybara::DSL
end

Capybara.save_path = "./tmp/capybara"

