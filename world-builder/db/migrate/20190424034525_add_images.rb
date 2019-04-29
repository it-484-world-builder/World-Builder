class AddImages < ActiveRecord::Migration
  def change
    add_attachment :locations, :image
    add_attachment :npcs, :image
  end
end
