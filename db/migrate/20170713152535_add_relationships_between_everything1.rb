class AddRelationshipsBetweenEverything1 < ActiveRecord::Migration[5.1]
  def change
    add_reference :couples, :users
    add_reference :special_classes, :users
    add_reference :weddings, :users
  end
end
