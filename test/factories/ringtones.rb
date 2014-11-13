include ActionDispatch::TestProcess

FactoryGirl.define do
  factory :ringtone do
    artist "MyString"
    song "MyString"
    source_file_name "test.mp3"
    source_content_type "audio/mp3"
    source_file_size 1024
  end
end
