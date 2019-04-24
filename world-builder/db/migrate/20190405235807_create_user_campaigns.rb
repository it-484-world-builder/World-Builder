class CreateUserCampaigns < ActiveRecord::Migration
  def change
    create_table :user_campaigns do |t|
      t.references 'user'
      t.references 'campaign'
      t.timestamps
    end
  end
end
