class CreateWeddings < ActiveRecord::Migration[5.0]
  def change
    create_table :weddings do |t|
      t.timestamp :created_at
      t.timestamp :updated_at
      t.string :nombre1
      t.string :nombre2
      t.date :fecha_matri
      t.integer :celular
      t.string :mail
      t.string :origen
      t.string :url_vals
      t.text :comentarios

      t.timestamps
    end
  end
end
