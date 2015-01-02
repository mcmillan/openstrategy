class Product < ActiveRecord::Base
  belongs_to :category
  has_many :product_clicks
  
  validates :title, presence: true
  validates :description, presence: true
  validates :url, presence: true, format: URI.regexp(%w(http https))
end
