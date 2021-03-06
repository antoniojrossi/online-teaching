module RequestSpecHelper
  def json
    JSON.parse(response.body)
  end

  def json_errors
    json['errors']
  end
  
  def json_error
    json_errors.first
  end

  def json_data
    json['data']
  end

  def json_included
    json['included']
  end

  def json_included_relationships
    json['included'].map { |relation| relation['relationships'] }
  end
end