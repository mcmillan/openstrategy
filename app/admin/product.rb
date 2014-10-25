ActiveAdmin.register Product do
  index do
    column :category
    column :title
    column :description
    column :url
    actions
  end
  
  permit_params :category_id, :title, :description, :url
end
