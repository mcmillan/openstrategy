class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.belongs_to :category, index: true
      t.string :title
      t.string :description
      t.string :url

      t.timestamps
    end
  end
end
