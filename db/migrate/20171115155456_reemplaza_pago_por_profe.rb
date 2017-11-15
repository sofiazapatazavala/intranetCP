class ReemplazaPagoPorProfe < ActiveRecord::Migration[5.1]
  def change
    add_column :lessons, :profesora, :string
  end
end
