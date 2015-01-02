ActiveAdmin.register Category do
  index do
    column :title
    column :weight
    actions
  end

  permit_params :title
end
