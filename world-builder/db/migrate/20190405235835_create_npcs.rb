class CreateNpcs < ActiveRecord::Migration
  def change
    create_table :npcs do |t|
      t.string 'name'
      t.text 'description'
      t.text 'gm_note'
      t.text 'player_note'
      t.references 'location'
      t.timestamps
    end
  end
end
