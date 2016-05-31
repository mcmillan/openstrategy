class CreateJobs < ActiveRecord::Migration
  def change
    create_table :jobs do |t|
      t.string :title
      t.string :company
      t.string :location
      t.string :contract_type
      t.text :description
      t.string :apply_link
      t.string :apply_url

      t.timestamps null: false
    end
  end
end
