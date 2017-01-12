class Lesson < ApplicationRecord
  belongs_to :bloggable, polymorphic: true
# Registra uploaders
  mount_uploader :video, VideoDeClaseUploader
  mount_uploaders :videos, VideoDeClaseUploader
end
