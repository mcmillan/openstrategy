class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :trackable, :validatable,
         :omniauthable

  def self.from_omniauth(auth)
    where(oauth_provider: auth['provider'], oauth_user_id: auth['uid']).first_or_create do |u|
      u.email = auth.info.email
      u.password = Devise.friendly_token[0, 20]
      u.name = auth.info.name
      u.location = auth.info.location
      u.bio = auth.info.description
      u.image = auth.info.image
    end
  end

  def email_required?
    super && oauth_provider.blank?
  end
end
