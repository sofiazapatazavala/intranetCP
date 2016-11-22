class CreateLessons < ActiveRecord::Migration[5.0]
  def change
    create_table :lessons do |t|
      t.date :fecha
      t.string :titulo
      t.text :notas

      t.timestamps
    end
  end
end
