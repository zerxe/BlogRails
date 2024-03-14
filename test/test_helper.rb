# test/test_helper.rb

# Load Rails environment
ENV['RAILS_ENV'] ||= 'test'
require_relative '../config/environment'
require 'rails/test_help'

# Load FactoryBot methods
require 'factory_bot'

class ActiveSupport::TestCase
  # Setup fixtures location for Mongoid
  self.file_fixture_path = "#{Rails.root}/test/fixtures"

  # Add more helper methods to be used by all tests here...
end

# Configure FactoryBot
class ActiveSupport::TestCase
  include FactoryBot::Syntax::Methods
end

# Clear out the database between tests when using Mongoid
class ActiveSupport::TestCase
  teardown do
    Mongoid::Config.purge!
  end
end
