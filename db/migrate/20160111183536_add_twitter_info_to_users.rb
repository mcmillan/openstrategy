class AddTwitterInfoToUsers < ActiveRecord::Migration
  def change
    add_column :users, :twitter_username, :string
    add_column :users, :twitter_access_token, :string
    add_column :users, :twitter_access_token_secret, :string
  end
end
