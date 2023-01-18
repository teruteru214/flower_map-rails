
10.times do
  User.create(
    name: Faker::Name.first_name,
      email: Faker::Internet.email,
      password: '12345678',
      password_confirmation: '12345678'
    )
end

20.times do |index|
  Flower.create(
    user: User.offset(rand(User.count)).first,
    name: 'ヒマワリ',
    datetime: Faker::Time.between(from: DateTime.now - 1, to: DateTime.now),
    status: 2,
    latitude: 35.7100069,
    longitude: 139.8108103,
    address: '〒131-0045 東京都墨田区押上１丁目１−２'
  )
end

require "csv"

CSV.foreach('db/flower_word.csv', headers: true) do |row|
FlowerWord.find_or_create_by(
  name: row['花の名前'],
  word: row['花言葉'])
end
