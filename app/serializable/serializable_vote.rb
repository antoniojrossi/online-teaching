class SerializableVote < JSONAPI::Serializable::Resource
  type 'votes'

  attributes :votable_type, :created_at, :updated_at
  has_one :teacher
  has_one :votable
end
