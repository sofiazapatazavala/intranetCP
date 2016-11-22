class AddApellidosToWeddings < ActiveRecord::Migration[5.0]
  def change
    add_column :weddings, :apellido1, :string
    add_column :weddings, :apellido2, :string
  end
end
