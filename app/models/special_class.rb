class SpecialClass < ApplicationRecord
# Relación para las clases
  has_many :lessons, as: :bloggable
end
