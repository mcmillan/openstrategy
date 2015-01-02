class CreateProductClicks < ActiveRecord::Migration
  def change
    create_table :product_clicks do |t|
      t.belongs_to :product, index: true
      t.string :user_agent
      t.string :ip_address

      t.timestamps
    end
  end
end
