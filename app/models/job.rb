class Job < ActiveRecord::Base
  extend FriendlyId
  CONTRACT_TYPES = %w(Full-time Contract).freeze

  friendly_id :title_and_company, use: :slugged

  belongs_to :user

  validates :user, presence: true
  validates :title, presence: true
  validates :company, presence: true
  validates :location, presence: true
  validates :contract_type, presence: true, inclusion: CONTRACT_TYPES
  validates :description, presence: true
  validates :apply_url, presence: true, format: URI.regexp(%w(http https)), if: -> { apply_email.blank? }
  validates :apply_email, presence: true, format: /@/, if: -> { apply_url.blank? }

  has_attached_file :image, styles: { thumb: '100x100#', hero: '300x300#' }
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\Z/
  validates_attachment_presence :image

  def title_and_company
    "#{title} at ##{company}"
  end

  def apply_link
    apply_url.blank? ?  "mailto:#{apply_email}" : apply_url
  end
end
