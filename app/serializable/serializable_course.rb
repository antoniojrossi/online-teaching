class SerializableCourse < JSONAPI::Serializable::Resource
  type 'courses'

  attributes :title, :created_at, :updated_at
end
