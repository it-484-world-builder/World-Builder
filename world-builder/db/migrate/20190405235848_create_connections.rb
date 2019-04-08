class CreateConnections < ActiveRecord::Migration
  def change
    create_table :connections do |t|
      t.references 'parent_location'
      t.references 'child_location'
      t.timestamps
    end
  end
end
