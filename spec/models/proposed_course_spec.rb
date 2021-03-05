require 'rails_helper'

RSpec.describe ProposedCourse, type: :model do
  # Association tests
  it { should belong_to :teacher }
  it { should belong_to :course }

  describe 'validations' do
    subject { build(:proposed_course) }
    it { should validate_uniqueness_of(:teacher).scoped_to(:course_id)}
  end
  
end
