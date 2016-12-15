class CreateCourses < ActiveRecord::Migration[5.0]
  def change
    create_table :courses do |t|
      t.string :nombre
      t.string :estilo
      t.string :edades

      t.timestamps
    end
  end
end
