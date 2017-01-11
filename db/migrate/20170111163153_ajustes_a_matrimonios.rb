class AjustesAMatrimonios < ActiveRecord::Migration[5.0]
  def change
    remove_column :weddings, :celular, :string
    remove_column :weddings, :mail, :string
    remove_column :weddings, :nombre_contacto, :string
    add_column :weddings, :contacto, :text
    add_column :weddings, :comentarios_pago, :text
  end
end
