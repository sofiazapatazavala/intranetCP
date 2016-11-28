class ChangeCelularToString < ActiveRecord::Migration[5.0]
  def change
    change_column :weddings, :celular, :string
  end
end
