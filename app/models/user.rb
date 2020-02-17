class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  def self.u_from_social_provider (provider, hash)
  		user = find_by(provider: provider, UID:hash[:UID])
		unless user.nil?
		 	return user
		end
		user = User.new
		user.email = hash[:email]
		user.UID = hash[:UID]
		user.provider = provider
		user.password = Devise.friendly_token[0, 20]
 		user.save
 		return user
  end
end
