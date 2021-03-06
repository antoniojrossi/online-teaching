class SerializableCourse < JSONAPI::Serializable::Resource
  type 'courses'

  attributes :title, :created_at, :updated_at

  has_many :votes do
    data do
      @object.votes
    end
    
    meta do
      { count: @object.votes.count }
    end
  end
end
