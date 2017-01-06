class Wedding < ApplicationRecord
# will_paginate
  self.per_page = 30
# Relación para las clases
  has_many :lessons, as: :bloggable
# Configura el uploader del diseño de piso
  mount_uploader :floordesign, DisenoDePisoUploader
# Incluye buscador, mediante PgSearch (búsqueda simple, no tan igual a Filterrific)
include PgSearch
multisearchable :against => [:nombre1, :nombre2]

end
