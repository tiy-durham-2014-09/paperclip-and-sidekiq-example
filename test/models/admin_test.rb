require 'test_helper'

class AdminTest < ActiveSupport::TestCase
  should validate_presence_of(:email)
end
