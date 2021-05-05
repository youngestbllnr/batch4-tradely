# This file is copied to spec/ when you run 'rails generate rspec:install'
require 'spec_helper'
ENV['RAILS_ENV'] ||= 'test'
require File.expand_path('../config/environment', __dir__)
# Prevent database truncation if the environment is production
abort("The Rails environment is running in production mode!") if Rails.env.production?
require 'rspec/rails'
require 'shoulda/matchers'
require 'factory_bot_rails'
require 'rails-controller-testing'

Rails::Controller::Testing.install

Dir[Rails.root.join('spec', 'support', '**', '*.rb')].sort.each { |f| require f }

begin
  ActiveRecord::Migration.maintain_test_schema!
rescue ActiveRecord::PendingMigrationError => e
  puts e.to_s.strip
  exit 1
end

RSpec.configure do |config|
  config.use_transactional_fixtures = false
  config.infer_spec_type_from_file_location!
  config.filter_rails_from_backtrace!

  config.include FactoryBot::Syntax::Methods
  
  config.include Devise::Test::ControllerHelpers, type: :controller

  config.before(:suite) do
    DatabaseRewinder.clean_all
  end

  config.after(:each) do
    DatabaseRewinder.clean
  end
end

Shoulda::Matchers.configure do |config|
    config.integrate do |with|
    with.test_framework :rspec
    with.library :rails
  end
end

RSpec.configure do |config|
  config.include Devise::Test::IntegrationHelpers, type: :request
end

# Cabybara Login Helper
def user_login(user)
  user.confirm
  
  visit new_user_session_path
  fill_in('Email Address', with: user.email)
  fill_in('Password', with: user.password)
  click_on('Log In')
end

# Capybara Add Brokers Stocks Helper
def add_broker_stocks(broker)
  user_login(broker)

  visit broker_dashboard_path
  click_on('Add to Portfolio', match: :first)
  
  visit destroy_user_session_path
end
