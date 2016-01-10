class AddCommunityEnabledToUsers < ActiveRecord::Migration
  def change
    add_column :users, :community_enabled, :boolean
  end
end
