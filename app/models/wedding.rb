class Wedding < ApplicationRecord
# will_paginate
  self.per_page = 30
# Relación para las clases
  has_many :lessons, as: :bloggable
# Configura uploaders
  mount_uploader :floordesign, DisenoDePisoUploader
  mount_uploader :song, SongUploader
  mount_uploader :avatar, PhotoUploader
# Incluye buscador
  include PgSearch
  pg_search_scope :buscar, against: [:nombre1, :nombre2]
end
