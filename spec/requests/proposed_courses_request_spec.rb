require 'rails_helper'

RSpec.describe 'ProposedCourses', type: :request do
  describe 'GET /proposed_courses' do
    let!(:proposed_courses) { create_list(:proposed_course, 5) }
    before { get '/proposed_courses' }

    it 'returns proposed courses' do
      expect(json).not_to be_empty
      expect(json).to have_key('data')
      expect(json['data'].count).to eq(5)
    end
  end

  describe 'POST /proposed_course' do
    before { post '/proposed_courses', params: valid_attributes }

    context 'when the request is valid' do
      let!(:teacher) { create(:teacher) }
      let!(:course) { create(:course) }
      let(:valid_attributes) { { teacher_id: teacher.id, course_id: course.id } }

      it 'returns status code 201' do
        expect(response).to have_http_status(201)
      end

      it 'creates a proposed course' do
        expect(json).not_to be_empty
        expect(json).to have_key('data')
        expect(json['data']['relationships']['course']['data']['id']).to eq(course.id.to_s)
        expect(json['data']['relationships']['teacher']['data']['id']).to eq(teacher.id.to_s)
      end
    end
  end
end
