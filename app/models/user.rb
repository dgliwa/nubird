class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :omniauthable, :omniauth_providers =>[:twitter]


  def self.from_omniauth(auth)
  	where(provider: auth.provider, uid: auth.uid.to_s).first_or_create do |user|
  		user.provider = auth.provider
  		user.uid = auth.uid
  		user.email = "#{auth.info.nickname}@example.org"
  		user.password = Devise.friendly_token[0,20]
  		user.access_token = auth.credentials.token
  		user.access_token_secret = auth.credentials.secret
  	end
  end
end