class AddContactDetailsToWeddings < ActiveRecord::Migration[5.0]
  def change
    add_column :weddings, :nombre3, :string
    add_column :weddings, :apellido3, :string
    add_column :weddings, :nombre4, :string
    add_column :weddings, :apellido4, :string
    add_column :weddings, :nombre_contacto, :string
    add_column :weddings, :telefono_novio, :string
    add_column :weddings, :telefono_novia, :string
    add_column :weddings, :email_novio, :string
    add_column :weddings, :email_novia, :string
    add_column :weddings, :tipo_descuento, :string
  end
end
