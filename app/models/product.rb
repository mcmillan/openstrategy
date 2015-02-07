class Product < ActiveRecord::Base
  belongs_to :category
  has_many :product_clicks
  has_many :favorites
  has_many :users, through: :favorites

  validates :title, presence: true
  validates :description, presence: true
  validates :url, presence: true, format: URI.regexp(%w(http https))

  def color
    max = 128
    Color::RGB.new(rand(0..max), rand(0..max), rand(0..max)).html
  end

  def favorited_by?(user)
    users.where(id: user.id).any?
  end
end
