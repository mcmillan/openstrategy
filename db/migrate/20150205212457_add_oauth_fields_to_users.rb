class AddOauthFieldsToUsers < ActiveRecord::Migration
  def change
    add_column :users, :oauth_provider, :string
    add_column :users, :oauth_user_id, :string
  end
end
