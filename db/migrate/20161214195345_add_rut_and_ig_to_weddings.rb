class AddRutAndIgToWeddings < ActiveRecord::Migration[5.0]
  def change
    add_column :weddings, :rut_novia, :string
    add_column :weddings, :rut_novio, :string
    add_column :weddings, :instagram_novia, :string
  end
end
