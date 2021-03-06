class TeacherSerializer < ActiveModel::Serializer
  include SerializableVotes

  attributes :id, :email, :created_at, :updated_at
end
