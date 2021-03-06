FactoryBot.define do
  factory :vote do
    association :teacher

    trait :for_teacher do
      association :votable, factory: :teacher
    end

    trait :for_course do
      association :votable, factory: :course
    end
  end
end