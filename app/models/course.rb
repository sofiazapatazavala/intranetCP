class Course < ApplicationRecord
  has_many :students
# Incluye buscador
  include PgSearch
  pg_search_scope :buscar, against: [:nombre]
end
