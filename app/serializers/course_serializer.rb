class CourseSerializer < ActiveModel::Serializer
  include SerializableVotes

  attributes :id, :title, :created_at, :updated_at
end
