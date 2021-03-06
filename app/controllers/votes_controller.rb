class VotesController < ApplicationController
  before_action :set_teacher, :set_votable

  def create
    vote = Vote.create!(teacher: @teacher, votable: @votable)
    json_response vote, status: 201
  end

  private

  def vote_params
    params.permit(:voter_id, :teacher_id, :course_id)
  end

  def set_teacher
    @teacher = Teacher.find_by_id(vote_params[:voter_id])
  end

  def set_votable
    resource, id = request.path.split('/')[1, 2]
    @votable = resource.singularize.classify.constantize.find_by_id(id)
  end
end
