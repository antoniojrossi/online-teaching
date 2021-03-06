class ProposedCoursesController < ApplicationController
  MAX_ITEMS_PER_PAGE=10

  def index
    proposed_courses = ProposedCourse.all.paginate(page: params[:page], per_page: MAX_ITEMS_PER_PAGE)
    json_response proposed_courses, include: [:teacher, :course]
  end

  def create
    proposed_course = ProposedCourse.create!(proposed_course_params)
    json_response proposed_course, include: [:teacher, :course], status: 201
  end

  private

  def proposed_course_params
    params.permit(:teacher_id, :course_id)
  end
end
