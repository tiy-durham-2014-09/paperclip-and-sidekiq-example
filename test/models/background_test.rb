require 'test_helper'

class BackgroundTest < ActiveSupport::TestCase
  should validate_presence_of(:title)
  should validate_attachment_presence(:image)
  should validate_attachment_content_type(:image).
             allowing('image/png', 'image/jpeg').
             rejecting('audio/mp3', 'text/xml')
end
