class CoursesController < ApplicationController
  MAX_ITEMS_PER_PAGE = 10

  def index
    courses = Course.all.paginate(page: params[:page], per_page: MAX_ITEMS_PER_PAGE)
    json_response courses
  end

  def show
    course = Course.find(params[:id])
    json_response course
  end

  def create
    course = Course.create!(course_params)
    json_response course, status: 201
  end

  private

  def course_params
    params.permit(:title)
  end
end
