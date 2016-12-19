class Lesson < ApplicationRecord
  belongs_to :bloggable, polymorphic: true
  # Uploader de video
  mount_uploader :video, VideoDeClaseUploader
end
