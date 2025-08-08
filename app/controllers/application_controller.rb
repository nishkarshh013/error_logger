class ApplicationController < ActionController::Base

	#in starting we will show last created app
	def current_app
		if current_user.present?
			current_app = current_user.apps.last 
		end
	end
end
