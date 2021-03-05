module Response
  def json_response(object, options: {}, status: :ok)
    render jsonapi: object, **options, status: status
  end

  def json_error_response(id:, status:, code:, detail:)
    render jsonapi_errors: { id: id, status: status, code: code, detail: detail },
           status: status
  end
end