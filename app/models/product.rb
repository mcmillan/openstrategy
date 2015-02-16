class Product < ActiveRecord::Base
  belongs_to :category
  has_many :product_clicks
  has_many :favorites
  has_many :users, through: :favorites

  validates :title, presence: true
  validates :description, presence: true
  validates :url, presence: true, format: URI.regexp(%w(http https))

  def favorited_by?(user)
    users.where(id: user.id).any?
  end
end
