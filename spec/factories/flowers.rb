FactoryBot.define do
  factory :flower do
    latitude { Faker::Address.latitude }
    longitude { Faker::Address.longitude }
    sequence(:address) { |n| "東京都文京区#{n}番地" }
    sequence(:name) { "ヒマワリ" }
    datetime { Faker::Time.between(from: DateTime.now - 1, to: DateTime.now) }
    sequence(:status) { 3 }
    association :user
  end
end
