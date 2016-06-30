ActiveAdmin.register Product do
  filter :category
  filter :promoted

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
    column 'Clicks', :product_clicks_count
    column 'Logo' do |p|
      p.logo.present? ? link_to('View', p.logo.url, target: '_blank') : '-'
    end
    actions
  end

  permit_params :category_id, :title, :description, :url, :promoted, :logo
end
