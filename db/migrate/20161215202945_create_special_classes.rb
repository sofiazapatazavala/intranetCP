class CreateSpecialClasses < ActiveRecord::Migration[5.0]
  def change
    create_table :special_classes do |t|
      t.string :nombre1
      t.string :nombre2
      t.string :nombre3
      t.string :nombre4
      t.string :nombre5
      t.string :nombre6
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
