module Response
  def json_response(object, options = {})
    render jsonapi: object, **options
  end

  def json_error_response(error, status:)
    render jsonapi_errors: error, status: status
  end
end