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
end
