class ErrorsController < ApplicationController

  before_action :verify_authenticity_token
  before_action :authenticate_user!

  def show
    @error_group = ErrorGroup.find(params[:id])

    respond_to do |format|
      format.turbo_stream {
        render partial: "errors/show", locals: { error_group: @error_group }
      }
      format.html {
        render partial: "errors/show", locals: { error_group: @error_group }
      }
    end
  end
end
