class AddDefaultImageToNpc < ActiveRecord::Migration
  def change
    remove_column :npcs, :image_file_name
    change_table :npcs do |t|
      t.string :image_file_path, null: false, default: "/system/npcs/images/"
      t.string :image_file_name, null: false, default: "world-builder-npc-default.jpg"
    end
  end
end
