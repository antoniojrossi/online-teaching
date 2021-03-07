class ProposedCourseSerializer < ActiveModel::Serializer
  attributes :created_at, :updated_at
  
  has_one :teacher do
    link(:related) { teacher_url(object.id) }
  end
  has_one :course do
    link(:related) { course_url(object.id) }
  end
end
