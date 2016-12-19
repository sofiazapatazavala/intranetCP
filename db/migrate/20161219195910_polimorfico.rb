class Polimorfico < ActiveRecord::Migration[5.0]
  def change
    add_reference :weddings, :bloggable, polymorphic: true, index: true
    add_reference :special_classes, :bloggable, polymorphic: true, index: true
    add_reference :couples, :bloggable, polymorphic: true, index: true
  end
end
