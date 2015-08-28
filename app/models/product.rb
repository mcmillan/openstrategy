class Product < ActiveRecord::Base
  belongs_to :category
  has_many :product_clicks
  has_many :favorites
  has_many :users, through: :favorites

  validates :category, presence: true
  validates :title, presence: true
  validates :description, presence: true
  validates :url, presence: true, format: URI.regexp(%w(http https))

  has_attached_file :logo
  validates_attachment_content_type :logo, content_type: /\Aimage\/.*\Z/

  def favorited_by?(user)
    users.where(id: user.id).any?
  end
end
