require 'faker'

FactoryGirl.define do
  factory :dog do |f|
    f.location {"92603" }
    f.name { Faker::Name.first_name }
    f.age { 2 }
    f.title_age { "baby" }
    f.breed { "Corgi" } 
    f.gender { "female" }
    f.adoptable { true }
    f.size { "small" }
    f.photo { "http://3milliondogs.com/blog-assets-two/2014/08/corgicute.jpg" }
    f.color { "white, black, orange" }
    f.birth_date { Faker::Date.birthday(1, 9) }
  end
end
