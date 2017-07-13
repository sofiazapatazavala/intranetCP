class SpecialClass < ApplicationRecord
# Relaciones con usuarios y con clases
  has_many :lessons, as: :bloggable, dependent: :destroy
  belongs_to :user
# Incluye buscador
  include PgSearch
# Usaremos scopes
  pg_search_scope :buscar, against: [:nombre1, :nombre2]
end
