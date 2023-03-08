FactoryBot.define do
  factory :collection do
    title { Faker::Games::WorldOfWarcraft.hero }
    description { Faker::Games::WorldOfWarcraft.quote }
    association :user

    factory :collection_with_cards do
      after(:create) do |collection|
        create_list(:card, 5, collection: collection)
      end
    end
  end
end