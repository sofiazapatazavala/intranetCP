class AddFloorDesignToWeddings < ActiveRecord::Migration[5.0]
  def change
    add_column :weddings, :floordesign, :string
  end
end
