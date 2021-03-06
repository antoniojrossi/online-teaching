class SerializableTeacher < JSONAPI::Serializable::Resource
  type 'teachers'

  attributes :email
  
  has_many :votes do
    data do
      @object.votes
    end
    
    meta do
      { count: @object.votes.count }
    end
  end
end
