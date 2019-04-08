class CreateWorlds < ActiveRecord::Migration
  def change
    create_table :worlds do |t|
      t.string 'name'
      t.text 'description'
      t.text 'gm_note'
      t.text 'character_note'
      t.timestamps
    end
  end
end
