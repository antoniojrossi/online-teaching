require 'rails_helper'

RSpec.describe 'Courses', type: :request do
  let!(:courses) { create_list(:course, 5) }
  let(:course_id) { courses.first.id.to_s }

  describe 'GET /courses' do
    before { get '/courses' }

    it 'returns courses' do
      expect(json).not_to be_empty
      expect(json).to have_key('data')
      expect(json['data'].count).to eq(5)
    end

    it 'returns status code 200' do
      expect(response).to have_http_status(200)
    end
  end

  describe 'GET /courses/:id' do
    before { get "/courses/#{course_id}" }
    
    context 'when the course exists' do
      it 'returns the course' do
        expect(json).not_to be_empty
        expect(json['data']['id']).to eq(course_id)
      end

      it 'returns status code 200' do
        expect(response).to have_http_status(200)
      end
    end

    context 'when the course does not exists' do
      let(:course_id) { 0 }

      it 'returns status code 404' do
        expect(response).to have_http_status(404)
      end

      it 'returns aditional info of error' do
        expect(json['errors']).not_to be_empty
        expect(json['errors'].count).to eq(1)
        expect(json['errors'].first['id']).not_to be_empty
        expect(json['errors'].first['code']).to match(/not-found/)
        expect(json['errors'].first['status']).to match(404)
        expect(json['errors'].first['detail']).to match(/Couldn't find Course/)
      end
    end
  end
end
