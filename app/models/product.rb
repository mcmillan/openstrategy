class Product < ActiveRecord::Base
  belongs_to :category
  has_many :product_clicks

  validates :title, presence: true
  validates :description, presence: true
  validates :url, presence: true, format: URI.regexp(%w(http https))

  def color
    Digest::MD5.hexdigest(title)[0...6]
  end
end
