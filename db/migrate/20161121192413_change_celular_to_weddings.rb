class ChangeCelularToWeddings < ActiveRecord::Migration[5.0]
  def change
    change_column :weddings, :celular, :integer, { limit: 32 }
  end
end
