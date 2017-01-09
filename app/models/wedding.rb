class Wedding < ApplicationRecord
# will_paginate
  self.per_page = 30
# Relación para las clases
  has_many :lessons, as: :bloggable
# Configura el uploader del diseño de piso
  mount_uploader :floordesign, DisenoDePisoUploader
# Incluye buscador
  include PgSearch
# Sí usaremos scopes
  pg_search_scope :buscar, against: [:nombre1, :nombre2]
# NO usaremos multisearchable
# multisearchable :against => [:nombre1, :nombre2]
end
