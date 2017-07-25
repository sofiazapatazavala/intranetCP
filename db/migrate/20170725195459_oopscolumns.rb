class Oopscolumns < ActiveRecord::Migration[5.1]
  def change
    rename_column :weddings, :users_id, :user_id
    rename_column :couples, :users_id, :user_id
    rename_column :special_classes, :users_id, :user_id
  end
end
