class AddProductClicksCountToProducts < ActiveRecord::Migration
  def change
    add_column :products, :product_clicks_count, :integer
  end
end
