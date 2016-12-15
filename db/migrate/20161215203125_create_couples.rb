class CreateCouples < ActiveRecord::Migration[5.0]
  def change
    create_table :couples do |t|
      t.string :nombre1
      t.string :nombre2
      t.string :contacto
      t.string :email
      t.string :telefono
      t.string :comoseenteraron
      t.string :descuento
      t.string :comentarios

      t.timestamps
    end
  end
end
