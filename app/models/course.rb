class Course < ApplicationRecord
  has_many :students, , dependent: :destroy
# Incluye buscador
  include PgSearch
  pg_search_scope :buscar, against: [:nombre]
# Uploader
  mount_uploaders :photos, PhotoUploader
end
