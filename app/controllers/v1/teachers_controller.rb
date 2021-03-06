module V1
  class TeachersController < ApplicationController
    before_action :set_teacher, only: [:show, :update, :destroy]

    def index
      teachers = Teacher.order(:created_at).includes(:votes)
      paginate json: teachers
    end

    def show
      json_response @teacher
    end

    def create
      teacher = Teacher.create!(teacher_params)
      json_response teacher, status: 201
    end

    def update
      @teacher.update(teacher_params)
      head :no_content
    end

    def destroy
      @teacher.destroy
      head :no_content
    end

    private

    def teacher_params
      params.permit(:email)
    end

    def set_teacher
      @teacher = Teacher.find(params[:id])
    end
  end
end