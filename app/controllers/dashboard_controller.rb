class DashboardController < ApplicationController

  before_action :verify_authenticity_token
  before_action :authenticate_user!
  def index
    @errors = ErrorGroup.joins(app: :user).where(apps: { id: current_app}, users: { id:current_user} )
  end
end
