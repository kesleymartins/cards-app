FactoryBot.define do
  factory :execution do
    size { 1 }
    association :collection 
    association :user 
  end
end
