class Article < ActiveRecord::Base
  belongs_to :user
  has_many :votes

  validates :user, presence: true
  validates :title, presence: true
  validates :description, presence: true
  validates :url, presence: true, format: URI.regexp(%w(http https))

  def score
    votes.where(positive: true).count - votes.where(positive: false).count
  end
end
