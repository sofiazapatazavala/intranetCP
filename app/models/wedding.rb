class Wedding < ApplicationRecord
# will_paginate
self.per_page = 2
# Relación para las clases
  has_many :lessons
# Configura el uploader del diseño de piso
  mount_uploader :floordesign, DisenoDePisoUploader
# Filterrific para los matris
  filterrific(
    default_filter_params: { },
    available_filters: [:search_query]
  )

  scope :search_query, lambda { |query|
    return nil  if query.blank?
    # condition query, parse into individual keywords
    terms = query.downcase.split(/\s+/)
    # replace "*" with "%" for wildcard searches,
    # append '%', remove duplicate '%'s
    terms = terms.map { |e|
      (e.gsub('*', '%') + '%').gsub(/%+/, '%')
    }
    # configure number of OR conditions for provision
    # of interpolation arguments. Adjust this if you
    # change the number of OR conditions.
    num_or_conditions = 2
    where(
      terms.map {
        or_clauses = [
          "LOWER(weddings.nombre1) LIKE ?",
          "LOWER(weddings.apellido1) LIKE ?",
          "LOWER(weddings.email_novia) LIKE ?"
        ].join(' OR ')
        "(#{ or_clauses })"
      }.join(' AND '),
      *terms.map { |e| [e] * num_or_conditions }.flatten
    )
  }

end
