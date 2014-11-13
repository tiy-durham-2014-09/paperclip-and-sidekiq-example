require 'simplecov'
SimpleCov.start 'rails'
require "codeclimate-test-reporter"
CodeClimate::TestReporter.start

ENV['RAILS_ENV'] ||= 'test'
require File.expand_path('../../config/environment', __FILE__)
require 'rails/test_help'
require "paperclip/matchers"
require 'sidekiq/testing'
require_relative "support/after_commit"
require_relative "support/paperclip"

Sidekiq::Testing.fake!

class ActiveSupport::TestCase
  # Setup all fixtures in test/fixtures/*.yml for all tests in alphabetical order.
  fixtures :all
  extend Paperclip::Shoulda::Matchers
  include FactoryGirl::Syntax::Methods

  # Add more helper methods to be used by all tests here...
end