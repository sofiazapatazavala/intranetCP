class AddPaymentCheckToLessons < ActiveRecord::Migration[5.0]
  def change
    add_column :lessons, :clasepagada, :boolean
  end
end
