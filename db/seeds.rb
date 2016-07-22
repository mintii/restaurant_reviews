10.times do
  User.create(email: Faker::Internet.email, password: "password")
end

cuisine = ["Chinese", "Mexican", "Italian", "Japanese", "Greek", "French", "Thai", "Spanish", "Indian", "Mediterranean"]
10.times do
  User.find(rand(1..10)).restaurants.create(
      name: Faker::Hipster.sentence(rand(1..4)),
      cuisine: cuisine.sample,
      address: Faker::Address.street_address,
      city: Faker::Address.city,
      state: Faker::Address.state,
      zipcode: Faker::Address.zip_code )
end


20.times do
  User.find(rand(1..10)).reviews.create(
    rating: rand(1..5),
    body: Faker::Hipster.paragraph,
    restaurant_id: rand(1..10) )
end
