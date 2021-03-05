FactoryBot.define do
  factory :teacher do
    email { Faker::Internet.unique.email }
  end
end