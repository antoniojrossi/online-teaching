class ProposedCoursesController < ApplicationController
  def index
    # TODO: Remove .all
    proposed_courses = ProposedCourse.all
    json_response proposed_courses, options: { include: [:teacher, :course] }
  end

  def create
    proposed_course = ProposedCourse.create!(proposed_course_params)
    json_response proposed_course, status: 201, options: { include: [:teacher, :course] }
  end

  private

  def proposed_course_params
    params.permit(:teacher_id, :course_id)
  end
end
