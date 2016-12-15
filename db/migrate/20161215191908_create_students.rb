class CreateStudents < ActiveRecord::Migration[5.0]
  def change
    create_table :students do |t|
      t.string :nombre
      t.string :telefono
      t.string :email
      t.string :comoseenteraron
      t.string :descuento
      t.string :comentarios

      t.timestamps
    end
  end
end
