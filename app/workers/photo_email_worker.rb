class PhotoEmailWorker
  include Sidekiq::Worker

  def perform(photo_id)
    photo = Photo.find(photo_id)
    sleep 3
    Rails.logger.debug("finished job for #{photo.id}")
    # email people
  end
end
