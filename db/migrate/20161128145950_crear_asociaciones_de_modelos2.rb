class CrearAsociacionesDeModelos2 < ActiveRecord::Migration[5.0]
  def change
    add_index :lessons, :wedding_id
  end
end
