class CreateReplies < ActiveRecord::Migration
  def change
    create_table :replies do |t|
      t.belongs_to :user, index: true, foreign_key: true
      t.integer :parent_id
      t.string :parent_type
      t.text :body

      t.timestamps null: false
    end
  end
end
