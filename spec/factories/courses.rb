FactoryBot.define do
  factory :course do
    title { "Paint like #{Faker::Artist.unique.name}" }
  end
end