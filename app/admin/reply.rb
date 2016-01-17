ActiveAdmin.register Reply do
  menu false
  permit_params :body

  sidebar 'Replies', only: [:show, :edit] do
    ul do
      reply.replies.each do |r|
        li link_to r.user.name, admin_reply_path(r)
      end
    end
  end
end
