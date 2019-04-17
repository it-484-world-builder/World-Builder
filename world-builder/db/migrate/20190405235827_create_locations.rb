class CreateLocations < ActiveRecord::Migration
  def change
    create_table :locations do |t|
      t.string 'name'
      t.text 'description'
      t.text 'gm_note'
      t.text 'character_note'
      t.references 'world'
      t.references 'tag'
      t.timestamps
    end
  end
end
