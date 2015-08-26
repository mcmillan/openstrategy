ActiveAdmin.register Product do
  index do
    column :category
    column :title
    column :description
    column :url
    column :promoted
    column 'Clicks', sortable: :product_clicks_count do |p|
      p.product_clicks.count
    end
    actions
  end

  permit_params :category_id, :title, :description, :url, :promoted

  controller do
    def scoped_collection
      end_of_association_chain.includes(:product_clicks)
    end
  end
end
