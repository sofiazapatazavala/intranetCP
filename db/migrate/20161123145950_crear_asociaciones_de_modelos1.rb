class CrearAsociacionesDeModelos1 < ActiveRecord::Migration[5.0]
  def change
    add_index :lessons, :wedding_id
  end
end
