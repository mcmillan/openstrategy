ActiveAdmin.register Article do
  index do
    column :title
    column :description
    column 'URL', :url
    column 'Submitted By', :user
    column :score
    actions
  end

  permit_params :user_id, :title, :description, :url
  controller do
    def new
      super do
        @article.user = current_user
      end
    end

  end
end
