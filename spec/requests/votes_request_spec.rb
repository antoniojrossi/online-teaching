require 'rails_helper'

RSpec.describe "Votes", type: :request do
  describe 'POST /teachers/:teacher_id/votes' do
    before { post "/teachers/#{teacher_id}/votes", params: attributes }
    
    context 'when the request is valid' do
      let!(:teacher) { create(:teacher) }
      let(:teacher_id) { teacher.id }
      let(:attributes) { { voter_id: teacher.id } }
      it 'returns status code 201' do
        expect(response).to have_http_status(201)
      end

      it 'register a new vote' do
        expect(teacher.votes.count).to eq(1)
        expect(teacher.votes.first.teacher).to eq(teacher)
        expect(teacher.voted_on.count).to eq(1)
        expect(teacher.voted_on.first.votable).to eq(teacher)
      end

      it 'returns info about new vote' do
        expect(json_data).not_to be_empty
        expect(json_data['id']).to be_present
        expect(json_data['attributes']['votable_type']).to eq('Teacher')
      end
    end

    context 'when request is not valid' do
      let!(:teacher) { create(:teacher) }
      let(:teacher_id) { teacher.id }

      context 'when voter does not exists' do
        let(:attributes) { { voter_id: 0 } }

        it 'returns status code 422' do
          expect(response).to have_http_status(422)
        end

        it 'returns aditional info of error' do
          expect(json_error).not_to be_empty
          expect(json_error['id']).not_to be_empty
          expect(json_error['code']).to match(/unprocessable-entity/)
        end
      end

      context 'when teacher does not exists' do
        let(:teacher_id) { 0 }
        let(:attributes) { { voter_id: teacher.id } }

        it 'returns status code 422' do
          expect(response).to have_http_status(422)
        end

        it 'returns aditional info of error' do
          expect(json_error).not_to be_empty
          expect(json_error['id']).not_to be_empty
          expect(json_error['code']).to match(/unprocessable-entity/)
        end
      end

      context 'when already voted' do
        let!(:previous_vote) { create(:vote, :for_teacher) }
        let(:teacher_id) { previous_vote.votable.id }
        let(:attributes) { { voter_id: previous_vote.teacher.id } }

        it 'returns status code 422' do
          expect(response).to have_http_status(422)
        end

        it 'returns aditional info of error' do
          expect(json_error).not_to be_empty
          expect(json_error['id']).not_to be_empty
          expect(json_error['code']).to match(/unprocessable-entity/)
        end
      end
    end
  end

  describe 'POST /courses/:course_id/votes' do
    before { post "/courses/#{course_id}/votes", params: attributes }

    context 'when the request is valid' do
      let!(:teacher) { create(:teacher) }
      let!(:course) { create(:course) }
      let(:course_id) { course.id }
      let(:attributes) { { voter_id: teacher.id } }
      it 'returns status code 201' do
        expect(response).to have_http_status(201)
      end

      it 'register a new vote' do
        expect(course.votes.count).to eq(1)
        expect(course.votes.first.teacher).to eq(teacher)
        expect(teacher.voted_on.count).to eq(1)
        expect(teacher.voted_on.first.votable).to eq(course)
      end

      it 'returns info about new vote' do
        expect(json_data).not_to be_empty
        expect(json_data['id']).to be_present
        expect(json_data['attributes']['votable_type']).to eq('Course')
      end
    end

    context 'when request is not valid' do
      let!(:course) { create(:course) }
      let(:course_id) { course.id }

      context 'when voter does not exists' do
        let(:attributes) { { voter_id: 0 } }

        it 'returns status code 422' do
          expect(response).to have_http_status(422)
        end

        it 'returns aditional info of error' do
          expect(json_error).not_to be_empty
          expect(json_error['id']).not_to be_empty
          expect(json_error['code']).to match(/unprocessable-entity/)
        end
      end

      context 'when course does not exists' do
        let(:teacher_id) { 0 }
        let(:attributes) { { voter_id: course.id } }

        it 'returns status code 422' do
          expect(response).to have_http_status(422)
        end

        it 'returns aditional info of error' do
          expect(json_error).not_to be_empty
          expect(json_error['id']).not_to be_empty
          expect(json_error['code']).to match(/unprocessable-entity/)
        end
      end

      context 'when already voted' do
        let!(:previous_vote) { create(:vote, :for_course) }
        let(:course_id) { previous_vote.votable.id }
        let(:attributes) { { voter_id: previous_vote.teacher.id } }

        it 'returns status code 422' do
          expect(response).to have_http_status(422)
        end

        it 'returns aditional info of error' do
          expect(json_error).not_to be_empty
          expect(json_error['id']).not_to be_empty
          expect(json_error['code']).to match(/unprocessable-entity/)
        end
      end
    end
  end
end
