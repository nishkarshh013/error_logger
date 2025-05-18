class Api::ErrorsController < ApplicationController
	skip_before_action :verify_authenticity_token

	def create
		app = App.find_by(api_key: request.headers['X-API-KEY'])

		return render json: {error: 'Unauthorized'}, status: :unauthorized unless app

		error_class = params[:error_class]
		message = params[:message]
		backtrace = params[:backtrace]
		environment = params[:environment] || "production"

		fingerprint = Digest::SHA256.hexdigest("#{error_class}-#{message}-#{backtrace&.first}")

		group = app.error_groups.find_or_initialize_by(
			error_class: error_class,
			message: message,
			environment: environment,
			fingerprint: fingerprint
		)
		group.count ||=0
		group.count += 1
		group.save!

		group.error_occurrences.create!(
			backtrace: backtrace.join("\n"),
			occurred_at: Time.zone.now
		)

		render json: { status: "Logged"}
	end
end
