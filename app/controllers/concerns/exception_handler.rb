module ExceptionHandler
  extend ActiveSupport::Concern

  included do
    rescue_from ActiveRecord::RecordNotFound do |e|
      # TODO: Log error
      json_error_response id: SecureRandom.uuid, code: 'not-found', detail: e.message, status: 404
    end
  end
end