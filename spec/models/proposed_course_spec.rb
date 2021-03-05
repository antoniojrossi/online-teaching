require 'rails_helper'

RSpec.describe ProposedCourse, type: :model do
  # Association tests
  it { should belong_to :teacher }
  it { should belong_to :course }
end
