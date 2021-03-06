require 'faker'

FactoryBot.define do
  factory :dog do |f|
    f.id { 3 }
    f.location {"92603" }
    f.name { Faker::Name.first_name }
    f.age { 2 }
    f.title_age { "baby" }
    f.breed { "Corgi" } 
    f.gender { "female" }
    f.adoptable { true }
    f.photo { "https://siberianhusky.com/wp-content/uploads/2016/09/husky-pictures-4.jpg" }
    f.size { "small" }
    f.color { "white, black, orange" }
    f.birth_date { Faker::Date.birthday(1, 9) }
    f.admin_id { 1 }
  end
end
