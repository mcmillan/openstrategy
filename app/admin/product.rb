ActiveAdmin.register Product do
  form do |f|
    f.inputs do
      f.input :category
      f.input :title
      f.input :description
      f.input :url
      f.input :logo
      f.input :promoted
    end
    f.actions
  end

  index do
    column :category
    column :title
    column :description
    column :url
    column :promoted
    column 'Logo' do |p|
      p.logo.present? ? link_to('View', p.logo.url, target: '_blank') : '-'
    end
    column 'Clicks', sortable: :product_clicks_count do |p|
      p.product_clicks_count
    end
    actions
  end

  permit_params :category_id, :title, :description, :url, :promoted, :logo

  controller do
    def scoped_collection
      end_of_association_chain.includes(:product_clicks)
    end
  end
end
