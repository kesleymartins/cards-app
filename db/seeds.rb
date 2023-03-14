# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

# --- teste user --- # 
users = [].append(User.create!({
  email: 'user@email.com',
  password: '123456'
}))

# --- random user --- # 
9.times do
  users.append(User.create!({
    email: Faker::Internet.safe_email,
    password: Faker::Internet.password(min_length: 6)
  }))
end

# Data setup
users.each do |user|
  20.times do
    collection = user.collections.create!({
      title: Faker::Games::WorldOfWarcraft.hero,
      description: Faker::Games::WorldOfWarcraft.quote,
      privacy: rand(0..1) == 1 ? Privacy::PUBLIC : Privacy::PRIVATE,
      language: rand(0..1) == 1 ? Language::PORTUGUESE : Language::ENGLISH
    })

    10.times do
      collection.cards.create!({
        question: Faker::Books::Dune.quote,
        answer: Faker::Books::Dune.character,
      })
    end
  end
end