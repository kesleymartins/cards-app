FactoryBot.define do
  factory :card do
    question { Faker::Books::Dune.quote }
    answer { Faker::Books::Dune.character }
    association :collection
  end
end
