class Polimorfico < ActiveRecord::Migration[5.0]
  def change
    add_reference :lessons, :bloggable, polymorphic: true, index: true
  end
end
