puts "🌱 Seeding spices..."

# Seed your database here
10.times do
    user = User.create(
      name: Faker::Name.name,
      email: Faker::Internet.email,
      password: Faker::Internet.password,    )
end


puts "✅ Done seeding!"
