require 'rails_helper'

RSpec.describe Course, type: :model do
  # Validation tests
  it { should validate_presence_of(:title) }
  it { should validate_uniqueness_of(:title) }
end
