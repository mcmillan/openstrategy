class Reply < ActiveRecord::Base
  include OriginalPostable
  
  belongs_to :user
  belongs_to :parent, polymorphic: true
  has_many :replies, as: :parent

  validates :parent, presence: true
  validates :user, presence: true
  validates :body, presence: true

  default_scope -> { order('created_at ASC') }
end
