require 'faker'
Faker::Config.locale = 'fr'
User.destroy_all
# Création de 10 utilisateurs
10.times do
  first_name = Faker::Name.first_name
  last_name = Faker::Name.last_name
  email = "#{first_name.downcase}.#{last_name.downcase}@yopmail.com"
  description = Faker::Lorem.sentence(word_count: 15)

  User.create!(
    first_name: first_name,
    last_name: last_name,
    email: email,
    description: description
  )
end

puts "Les users ont été créés"