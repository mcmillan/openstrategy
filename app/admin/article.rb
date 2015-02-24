ActiveAdmin.register Article do
  permit_params :user_id, :title, :description, :url
  controller do
    def new
      super do
        @article.user = current_user
      end
    end
  end
end
