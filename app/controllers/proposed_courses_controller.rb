class ProposedCoursesController < ApplicationController
  def index
    # TODO: Remove .all
    proposed_courses = ProposedCourse.all
    json_response proposed_courses, include: [:teacher, :course]
  end
end
