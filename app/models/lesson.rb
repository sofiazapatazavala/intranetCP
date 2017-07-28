class Lesson < ApplicationRecord
  belongs_to :bloggable, polymorphic: true
# Registra uploaders
  mount_uploader :video, VideoDeClaseUploader
  mount_uploaders :videos, VideoDeClaseUploader
# def set_success(format, opts)
#   self.success = true
# end
end
