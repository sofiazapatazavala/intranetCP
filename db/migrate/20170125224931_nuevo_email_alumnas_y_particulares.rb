class NuevoEmailAlumnasYParticulares < ActiveRecord::Migration[5.0]
  def change
    add_column :students, :email2, :string
    add_column :special_classes, :email2, :string
    add_column :lessons, :valor_clase, :integer
  end
end
