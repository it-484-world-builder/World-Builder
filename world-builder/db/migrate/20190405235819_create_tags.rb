class CreateTags < ActiveRecord::Migration
  def change
    create_table :tags do |t|
      t.text 'name'
      t.integer 'rank'
      t.timestamps
    end
  end
end
