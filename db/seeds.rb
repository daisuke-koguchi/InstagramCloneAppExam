50.times do |n|
  name = Faker::Games::Pokemon.name
  email = Faker::Internet.email
  password = "password"
  photo = Faker::Avatar.image 
  User.create!(name: name,
              email: email,
              password: password,
              photo: photo
              )
end