class Lesson < ApplicationRecord
  belongs_to :wedding
  # Uploader de video
  mount_uploader :video, VideoDeClaseUploader
end
