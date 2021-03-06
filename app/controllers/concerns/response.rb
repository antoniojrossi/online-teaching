module Response
  def json_response(object, options = {})
    render json: object, **options
  end

  def json_error_response(error, status:)
    render json: error, status: status, serializer: ActiveModel::Serializer::ErrorSerializer
  end
end