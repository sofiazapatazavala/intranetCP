class DeleteColumnsFromWeddings < ActiveRecord::Migration[5.0]
  def change
    remove_column :weddings, :apellido1, :string
    remove_column :weddings, :apellido2, :string
    remove_column :weddings, :nombre3, :string
    remove_column :weddings, :apellido3, :string
    remove_column :weddings, :nombre4, :string
    remove_column :weddings, :apellido4, :string

    add_column :weddings, :maspersonas, :text
    end
end
