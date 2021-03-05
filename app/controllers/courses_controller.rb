class CoursesController < ApplicationController
  def index
    # TODO: Remove .all
    courses = Course.all
    json_response(courses)
  end

  def show
    course = Course.find(params[:id])
    json_response(course)
  end

  def create
    course = Course.create!(course_params)
    json_response(course)
  end

  private

  def course_params
    params.permit(:title)
  end
end
