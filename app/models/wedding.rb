class Wedding < ApplicationRecord
# Relación para las clases
  has_many :lessons
# Configura el uploader del diseño de piso
  mount_uploader :floordesign, DisenoDePisoUploader
# Filterrific para los matris
  filterrific(
    default_filter_params: { sorted_by: 'created_at_desc' },
    available_filters: [
      :sorted_by,
      :search_query
    ]
  )
# define ActiveRecord scopes for
# :search_query, :sorted_by, :with_country_id, and :with_created_at_gte
  scope :search_query, lambda { |query|
    # Searches the students table on the 'first_name' and 'last_name' columns.
    # Matches using LIKE, automatically appends '%' to each term.
    # LIKE is case INsensitive with MySQL, however it is case
    # sensitive with PostGreSQL. To make it work in both worlds,
    # we downcase everything.
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
    num_or_conds = 2
    where(
      terms.map { |term|
        "(LOWER(weddings.nombre1) LIKE ? OR LOWER(weddings.apellido1) LIKE ?)"
      }.join(' AND '),
      *terms.map { |e| [e] * num_or_conds }.flatten
    )
  }
  # scope :sorted_by, lambda { |sort_key|
    # Sorts students by sort_key
    # ...
  # }

  # This method provides select options for the `sorted_by` filter select input.
  # It is called in the controller as part of `initialize_filterrific`.
  # def self.options_for_sorted_by
  #   [
  #     ['Nombre de la novia (a-z)', 'nombre1_asc'],
  #     ['Registro (lo más reciente primero)', 'created_at_desc'],
  #     ['Registro (desde lo más antiguo)', 'created_at_asc'],
  #   ]
  # end

end
