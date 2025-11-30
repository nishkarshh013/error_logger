class AppsController < ApplicationController

	before_action :verify_authenticity_token
	before_action :authenticate_user!

	def index
		@apps = current_user.apps
	end

	def show
		@app = current_user.apps.find(params[:id])
  	@error_groups = @app.error_groups.order(created_at: :desc)
	end

	def new
		@app = App.new
	end

	def create
		@app = current_user.apps.create!(app_params)
	end

	private

	def app_params
		params.require(:app).permit(:name)
	end
end
