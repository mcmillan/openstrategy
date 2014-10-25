ActiveAdmin.register Category do
  index do
    column :title
    actions
  end
  
  permit_params :title
end
