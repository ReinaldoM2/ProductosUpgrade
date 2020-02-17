class SocialAuthController < ApplicationController

	def facebook_auth
		user = User.u_from_social_provider('facebook', params)
		render json: user
	end
end
