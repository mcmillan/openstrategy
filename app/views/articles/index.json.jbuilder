json.array!(@articles) do |article|
  json.extract!(article, :id, :title, :description, :url, :score)
  json.voted user_signed_in? && article.votes.where(user: current_user).any?
  json.user do
    json.extract!(article.user, :name, :image)
  end
end
