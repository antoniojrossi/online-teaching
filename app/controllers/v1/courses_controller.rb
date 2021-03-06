module V1
  class CoursesController < ApplicationController
    before_action :set_course, only: [:show, :update, :destroy]

    def index
      courses = Course.order(:created_at).includes([:votes])
      paginate json: courses
    end

    def show
      json_response @course
    end

    def create
      course = Course.create!(course_params)
      json_response course, status: 201
    end

    def update
      @course.update(course_params)
      head :no_content
    end

    def destroy
      @course.destroy
      head :no_content
    end

    private

    def course_params
      params.permit(:title)
    end

    def set_course
      @course = Course.find(params[:id])
    end
  end
end
