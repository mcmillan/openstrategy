class Category < ActiveRecord::Base
  has_many :products
  validates :title, presence: true
  default_scope -> { order(:weight) }

  scope :non_library, -> { where.not(id: [ENV['LIBRARY_CATEGORY_ID']].compact) }
end
