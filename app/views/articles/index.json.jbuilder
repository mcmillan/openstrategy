json.array!(@articles) do |article|
  json.extract!(article, :id, :title, :description, :url, :score)
  json.voted user_signed_in? && article.votes.where(user: current_user).any?
  json.week_commencing article.created_at.beginning_of_week
  json.user do
    json.extract!(article.user, :name, :image)
  end
end
