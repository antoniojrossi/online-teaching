class SerializableTeacher < JSONAPI::Serializable::Resource
  type 'teachers'

  attributes :email
end
