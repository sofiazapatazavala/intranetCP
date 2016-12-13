class Wedding < ApplicationRecord
# Relación para las clases
  has_many :lessons
# Configura el uploader del diseño de piso
  mount_uploader :floordesign, DisenoDePisoUploader
end
