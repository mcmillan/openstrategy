class AddMetadataToUsers < ActiveRecord::Migration
  def change
    add_column :users, :name, :string
    add_column :users, :location, :string
    add_column :users, :bio, :string
    add_column :users, :image, :string
  end
end
