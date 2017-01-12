class MasComentariosDePago < ActiveRecord::Migration[5.0]
  def change
    add_column :special_classes, :comentarios_pago, :text
    add_column :couples, :comentarios_pago, :text
    add_column :students, :pago, :string
    add_column :students, :comentarios_pago, :text
  end
end
