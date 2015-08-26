class AddPromotedToProducts < ActiveRecord::Migration
  def change
    add_column :products, :promoted, :boolean
  end
end
