FactoryBot.define do
  factory :flower do
    sequence(:latitude) { 35.7100069 }
    sequence(:longitude) { 139.8108103 }
    sequence(:address) { "〒131-0045 東京都墨田区押上１丁目１−２" }
    sequence(:name) { "ヒマワリ" }
    datetime { Faker::Time.between(from: DateTime.now - 1, to: DateTime.now) }
    sequence(:status) { 3 }
    flower_image { nil }
    association :user
  end
end
