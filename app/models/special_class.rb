class SpecialClass < ApplicationRecord
# Relación para las clases
  has_many :lessons, as: :bloggable
# Incluye buscador
  include PgSearch
# Usaremos scopes
  pg_search_scope :buscar, against: [:nombre1, :nombre2]
end
