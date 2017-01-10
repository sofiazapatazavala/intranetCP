class CreateArchives < ActiveRecord::Migration[5.0]
  def change
    create_table :archives do |t|
      t.string :nombre
      t.string :email
      t.string :telefono
      t.string :procedencia
      t.text :comentarios

      t.timestamps
    end
  end
end
