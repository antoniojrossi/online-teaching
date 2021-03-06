class SerializableCourse < JSONAPI::Serializable::Resource
  include SerializableVotes

  type 'courses'

  attributes :title, :created_at, :updated_at
end
