FactoryBot.define do
  factory :score do
    association :card
    association :user
  end
end
