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
end
