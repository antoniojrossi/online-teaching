class SerializableTeacher < JSONAPI::Serializable::Resource
  include SerializableVotes
  
  type 'teachers'

  attributes :email
end
