class Suggestion < ActiveRecord::Base
  belongs_to :category
  validates :title, presence: true
  validates :description, presence: true
  validates :url, presence: true, format: URI.regexp(%w(http https))
  validates :email, presence: true, format: /@/
end
