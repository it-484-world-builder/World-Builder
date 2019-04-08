class CreateCampaigns < ActiveRecord::Migration
  def change
    create_table :campaigns do |t|
      t.string 'name'
      t.references 'user'
      t.references 'world'
      t.timestamps
    end
  end
end
