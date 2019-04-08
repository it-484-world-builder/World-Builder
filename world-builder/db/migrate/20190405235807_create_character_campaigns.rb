class CreateCharacterCampaigns < ActiveRecord::Migration
  def change
    create_table :character_campaigns do |t|
      t.references 'character'
      t.references 'campaign'
      t.timestamps
    end
  end
end
