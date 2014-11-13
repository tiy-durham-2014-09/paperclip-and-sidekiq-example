require 'test_helper'

class RingtoneTest < ActiveSupport::TestCase
  should validate_presence_of(:song)
  should validate_attachment_presence(:source)
  should validate_attachment_content_type(:source).
             allowing('audio/mp3', 'audio/x-mpeg').
             rejecting('image/png', 'text/xml')

  should "make a new RingtoneCrop task when created" do
    ringtone = Ringtone.new(song: "Tone Up",
                            source: fixture_file_upload('files/test.mp3', 'audio/mp3'))

    assert_difference "RingtoneCropWorker.jobs.size" do
      ringtone.save!
    end
  end
end
