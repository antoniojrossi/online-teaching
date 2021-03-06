require 'rails_helper'

RSpec.describe Teacher, type: :model do
  describe 'associations' do
    it { should have_many(:voted_on).dependent(:destroy) }
    it { should have_many(:votes).dependent(:destroy) }
  end

  describe 'validations' do
    it { should validate_presence_of(:email) }
    it { should validate_uniqueness_of(:email) }

    # TODO: Validar formato del email
  end
end
