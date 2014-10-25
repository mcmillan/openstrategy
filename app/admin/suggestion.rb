ActiveAdmin.register Suggestion do
  index do
    column :category
    column :email
    column :twitter_username
    column :title
    column :description
    column :url
    actions
  end
  
  permit_params :category_id, :email, :title, :description, :url, :twitter_username
end
