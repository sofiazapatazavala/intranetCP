class NewUploadersForModels < ActiveRecord::Migration[5.0]
  def change
    add_column :weddings, :song, :string
    add_column :weddings, :avatar, :string
    add_column :lessons, :videos, :json
    add_column :courses, :photos, :json
  end
end
