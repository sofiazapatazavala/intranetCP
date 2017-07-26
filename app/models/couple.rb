class Couple < ApplicationRecord
# Relaciones con usuarios y con clases
  has_many :lessons, as: :bloggable, dependent: :destroy
  belongs_to :user
end
