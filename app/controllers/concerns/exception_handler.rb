module ExceptionHandler
  extend ActiveSupport::Concern

  ErrorInfo = Struct.new(:id, :code, :detail) do
    def initialize(id: SecureRandom.uuid, code:, detail:)
      super(id, code, detail)
    end
  end

  included do
    rescue_from ActiveRecord::RecordNotFound do |e|
      model = e.model.constantize.new
      model.errors.add(:id, "#{e.model} with #{e.primary_key} '#{e.id}' not found")
      
      json_error_response(model, status: 404)
    end

    rescue_from ActiveRecord::RecordInvalid do |e|
      json_error_response e.record, status: 422
    end
  end
end
