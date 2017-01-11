class Student < ApplicationRecord
  belongs_to :course
# Incluye buscador
  include PgSearch
  pg_search_scope :buscar, against: [:nombre]
end
