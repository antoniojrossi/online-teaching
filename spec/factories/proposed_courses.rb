FactoryBot.define do
  factory :proposed_course do
    association :teacher
    association :course
  end
end