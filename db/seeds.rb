10.times do |n|
  email = Faker::Internet.email
  password = "password"
  name = Faker::Name.name
  User.create!(email: email,
               password: password,
               password_confirmation: password,
               name: name,
               uid: rand(200) + 1,
               provider: rand(200) + 1,
               )
end

10.times do |n|
  title = Faker::Beer.style
  content = Faker::Beer.name
  Picture.create!(title: title,
               content: content,
               user_id: rand(10) + 1
               )
end
