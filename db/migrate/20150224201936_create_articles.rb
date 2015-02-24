class CreateArticles < ActiveRecord::Migration
  def change
    create_table :articles do |t|
      t.belongs_to :user, index: true
      t.string :title
      t.text :description
      t.string :url

      t.timestamps
    end
  end
end
