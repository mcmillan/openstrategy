class CreateSuggestions < ActiveRecord::Migration
  def change
    create_table :suggestions do |t|
      t.belongs_to :category, index: true
      t.string :email
      t.string :twitter_username
      t.string :title
      t.string :description
      t.string :url

      t.timestamps
    end
  end
end
