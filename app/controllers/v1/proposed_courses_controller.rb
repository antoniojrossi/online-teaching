module V1
  class ProposedCoursesController < ApplicationController
    def index
      proposed_courses = ProposedCourse.order(:created_at)
        .includes([:teacher, :course])
        .includes(teacher: :votes, course: :votes)
      paginate json: proposed_courses, include: [:teacher, :course] 
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
end
