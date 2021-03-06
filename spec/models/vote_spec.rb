require 'rails_helper'

RSpec.describe Vote, type: :model do
  describe 'associations' do
    it { should belong_to :teacher }
    it { should belong_to :votable }
  end

  describe 'validations' do
    subject { build(:vote, :for_teacher) }
    it { should validate_uniqueness_of(:teacher).scoped_to(:votable_id, :votable_type)}
  end
end
