class ProposedCoursesController < ApplicationController
  def index
    # TODO: Remove .all
    proposed_courses = ProposedCourse.all
    render jsonapi: proposed_courses, include: [:teacher, :course]
  end
end
