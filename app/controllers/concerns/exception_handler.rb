module ExceptionHandler
  extend ActiveSupport::Concern

  included do
    rescue_from ActiveRecord::RecordNotFound do |e|
      # TODO: Log error
      json_error_response({ id: SecureRandom.uuid, code: 'not-found', detail: e.message }, status: 404)
    end

    rescue_from ActiveRecord::RecordInvalid do |e|
      # TODO: Log error
      errors = e.record.errors.map do |error|
        { id: SecureRandom.uuid, code: 'unprocessable-entity', detail: error.full_message }
      end

      json_error_response errors, status: 422
    end
  end
end