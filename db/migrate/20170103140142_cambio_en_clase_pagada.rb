class CambioEnClasePagada < ActiveRecord::Migration[5.0]
  def change
    change_column :lessons, :clasepagada, :string
  end
end
