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
      address: '東京スカイツリー'
  )
end
