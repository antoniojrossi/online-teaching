require 'rails_helper'

RSpec.describe "Teachers", type: :request do
  let!(:teachers) { create_list(:teacher, 5) }
  let(:teacher_id) { teachers.first.id.to_s }

  describe 'GET /teachers' do
    before { get '/teachers' }

    it 'returns teachers' do
      expect(json).not_to be_empty
      expect(json).to have_key('data')
      expect(json_data.count).to eq(5)
    end

    it 'returns status code 200' do
      expect(response).to have_http_status(200)
    end
  end

  describe 'GET /teachers/:id' do
    before { get "/teachers/#{teacher_id}" }
    
    context 'when the teacher exists' do
      it 'returns the teacher' do
        expect(json).not_to be_empty
        expect(json_data['id']).to eq(teacher_id)
      end

      it 'returns status code 200' do
        expect(response).to have_http_status(200)
      end
    end

    context 'when the teacher does not exists' do
      let(:teacher_id) { 0 }

      it 'returns status code 404' do
        expect(response).to have_http_status(404)
      end

      it 'returns aditional info of error' do
        expect(json_errors).not_to be_empty
        expect(json_errors.count).to eq(1)
        expect(json_error['id']).not_to be_empty
        expect(json_error['code']).to match(/not-found/)
      end
    end
  end

  describe 'POST /teachers' do
    let(:valid_attributes) { { email: 'email@example.com' } }

    context 'when the request is valid' do
      before { post '/teachers', params: valid_attributes }

      it 'returns status code 201' do
        expect(response).to have_http_status(201)
      end
      it 'creates a teacher' do
        expect(json_data).not_to be_empty
        expect(json_data['attributes']['email']).to match(/#{valid_attributes[:email]}/)
      end
    end

    context 'when email is not valid' do
      before { post '/teachers', params: { email: 'invalid_email' } }

      it 'returns status code 422' do
        expect(response).to have_http_status(422)
      end

      it 'returns adition info of error' do
        expect(json_errors).not_to be_empty
        expect(json_errors.count).to eq(1)
        expect(json_error['id']).not_to be_empty
        expect(json_error['code']).to match(/unprocessable-entity/)
      end
    end
  end

  describe 'PUT /teachers/:id' do
    let(:valid_attributes) { { email: 'email@example.com' } }

    context 'when ther teacher exists' do
      before { put "/teachers/#{teacher_id}", params: valid_attributes }

      it 'returns status code 204' do
        expect(response).to have_http_status(204)  
      end
    end
  end

  describe 'DELETE /teachers/:id' do
    before { delete "/teachers/#{teacher_id}" }

    it 'returns status code 204' do
      expect(response).to have_http_status(204)
    end
  end
end
