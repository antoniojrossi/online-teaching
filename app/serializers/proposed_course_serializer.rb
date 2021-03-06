class ProposedCourseSerializer < ActiveModel::Serializer
  attributes :created_at, :updated_at
  
  has_one :teacher
  has_one :course
end
