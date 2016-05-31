ActiveAdmin.register Job do
  index do
    column :title
    column :company
    column :location
    column :user
    actions
  end

  form do |f|
    f.inputs do
      f.input :user
      f.input :title
      f.input :company
      f.input :location
      f.input :contract_type, as: :select, collection: Job::CONTRACT_TYPES
      f.input :description
      f.input :apply_email, hint: 'Only required if apply URL is not set'
      f.input :apply_url, hint: 'Only required if apply email is not set'
      f.input :image, as: :file
    end
    f.actions
  end

  permit_params :user_id, :title, :company, :location, :contract_type, :description, :apply_email, :apply_url, :image
end
