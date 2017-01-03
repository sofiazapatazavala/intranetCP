class AddPagoToLessons < ActiveRecord::Migration[5.0]
  def change
    add_column :lessons, :pago, :string
    remove_column :lessons, :clasepagada, :string
    remove_column :lessons, :wedding_id
  end
end
