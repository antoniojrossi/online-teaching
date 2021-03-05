require 'rails_helper'

RSpec.describe Teacher, type: :model do
  # Validation tests
  it { should validate_presence_of(:email) }
  it { should validate_uniqueness_of(:email) }
end
