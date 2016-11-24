class CrearColumnaDeModelos1 < ActiveRecord::Migration[5.0]
  def change
    add_column :lessons, :wedding_id, :integer
  end
end
