class Post < ActiveRecord::Base
  include OriginalPostable

  extend FriendlyId
  friendly_id :title, use: :slugged

  belongs_to :user
  has_many :replies, as: :parent

  validates :user, presence: true
  validates :title, presence: true
  validates :url, format: URI.regexp(%w(http https)), allow_blank: true

  default_scope -> { order('sticky DESC NULLS LAST, created_at DESC') }

  def domain
    URI.parse(url).hostname
  end
end
