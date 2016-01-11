class User < ActiveRecord::Base
  extend FriendlyId

  friendly_id :name, use: :slugged

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :trackable, :validatable,
         :omniauthable
  has_many :favorites
  has_many :products, through: :favorites

  def self.from_omniauth(auth)
    u = where(oauth_provider: auth['provider'], oauth_user_id: auth['uid']).first_or_initialize do |u|
      u.email = auth.info.email
      u.password = Devise.friendly_token[0, 20]
    end

    u.name = auth.info.name
    u.location = auth.info.location
    u.bio = auth.info.description
    u.image = auth.info.image
    u.twitter_username = auth.info.nickname
    u.twitter_access_token = auth.credentials.token
    u.twitter_access_token_secret = auth.credentials.secret

    u.save

    u
  end

  def email_required?
    super && oauth_provider.blank?
  end
end
