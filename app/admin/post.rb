ActiveAdmin.register Post do
  permit_params :title, :body, :url, :sticky, :user

  form do |f|
    f.inputs do
      f.input :user
      f.input :title
      f.input :url
      f.input :body
      f.input :sticky
    end
    f.actions
  end

  index do
    column :title
    column :replies do |p|
      p.replies.count
    end
    column :user
    column :sticky
    actions
  end

  sidebar 'Replies', only: [:show, :edit] do
    ul do
      post.replies.each do |r|
        li link_to r.user.name, admin_reply_path(r)
      end
    end
  end
end
