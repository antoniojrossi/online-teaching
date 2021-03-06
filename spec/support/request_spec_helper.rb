module RequestSpecHelper
  def json
    JSON.parse(response.body)
  end

  def json_errors
    json['errors']
  end
  
  def json_error_codes
    json_errors.map { |error| error['code'] }
  end

  def json_error_ids
    json_errors.map { |error| error['id'] }
  end

  def json_error_details
    json_errors.map { |error| error['detail'] }
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

  def number_of_votes_for(type:, id:)
    pp json_included
    pp type
    pp id
    json_included.detect do |relation_info|
      relation_info['type'] == type.to_s && relation_info['id'] == id.to_s
    end['relationships']['votes']['meta']['count']
  end
end