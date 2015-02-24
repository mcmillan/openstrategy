class Vote < ActiveRecord::Base
  belongs_to :user
  belongs_to :article

  validates :user, presence: true
  validates :article, presence: true
  validates :positive, presence: true
end
