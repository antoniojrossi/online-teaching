module ExceptionHandler
  extend ActiveSupport::Concern

  included do
    rescue_from ActiveRecord::RecordNotFound do |e|
      error = { id: SecureRandom.uuid, code: 'not-found', detail: e.message }

      logger.error("ERROR - #{error[:id]} - #{error}")

      json_error_response(error, status: 404)
    end

    rescue_from ActiveRecord::RecordInvalid do |e|
      errors = e.record.errors.map do |error|
        { id: SecureRandom.uuid, code: 'unprocessable-entity', detail: error.full_message }
      end

      errors.each { |error| logger.error("ERROR - #{error[:id]} - #{error}") }

      json_error_response errors, status: 422
    end
  end
end
