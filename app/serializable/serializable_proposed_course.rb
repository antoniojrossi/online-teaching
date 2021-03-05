class SerializableProposedCourse < JSONAPI::Serializable::Resource
  type 'proposed_courses'

  attributes :created_at, :updated_at
  
  has_one :teacher
  has_one :course
  # TODO: mirar como añadir caché
end
