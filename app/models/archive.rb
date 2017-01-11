class Archive < ApplicationRecord
# Incluye buscador
  include PgSearch
  pg_search_scope :buscar, against: [:nombre]
end
