module RequestSpecHelper
  def json
    JSON.parse(response.body)
  end

  def json_errors
    json['errors']
  end
  
  def json_error_codes
    json_errors.map{ |error| error['code'] }
  end

  def json_error_ids
    json_errors.map{ |error| error['id'] }
  end

  def json_error_details
    json_errors.map{ |error| error['detail'] }
  end

  def json_error
    json_errors.first
  end

  def json_data
    json['data']
  end
end