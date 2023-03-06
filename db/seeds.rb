puts "🌱 Seeding spices..."

# Seed your database here
10.times do
    user = User.create(
      name: Faker::Name.name,
      email: Faker::Internet.email,
      password: "password"
    )
end

70.times do |i|

    Task.create(
      user_id: rand(1..10),
      name: Faker::Name.name,
      description: Faker::Lorem.sentence,
      date: Faker::Date.between(from: '2023-03-28', to: '2023-07-28'),     
      due_date: Faker::Date.between(from: '2023-09-29', to: '2023-10-05'),
      status: ['Completed', 'still in progress', 'Starting'].sample,
    )
  end

puts "✅ Done seeding!"

