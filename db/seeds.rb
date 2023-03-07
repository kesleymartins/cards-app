# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

user = User.create!({
    email: 'user@email.com',
    password: '123456'
})

6.times do
    collection = Collection.create!({
        title: Faker::Games::WorldOfWarcraft.hero,
        description: Faker::Games::WorldOfWarcraft.quote,
        user: user
    })

    50.times do
        Card.create!({
            question: Faker::Books::Dune.quote,
            answer: Faker::Books::Dune.character,
            collection: collection
        })
    end
end