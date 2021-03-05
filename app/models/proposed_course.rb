class ProposedCourse < ApplicationRecord
  belongs_to :teacher
  belongs_to :course

  validates :teacher, uniqueness: { scope: :course_id }
end
