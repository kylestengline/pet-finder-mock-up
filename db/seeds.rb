# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
# # Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Dog.destroy_all


unless Admin.find_by( email: "stuff@things.com" )
  Admin.create!(
    email: "stuff@things.com",
    password: "password"
  )
end

Dog.create!([
  { 
    location: "92603",
    name: Faker::Name.first_name,
    age: 2,
    title_age: "baby",
    breed: "Corgi" ,
    gender: "female",
    adoptable: true,
    size: "small",
    photo: "http://3milliondogs.com/blog-assets-two/2014/08/corgicute.jpg",
    color: "white, black, orange",
    birth_date: Faker::Date.birthday(1, 9),
    admin_id: 1
  },
  { 
    location: "92603",
    name: Faker::Name.first_name,
    age: 7,
    title_age: "adult",
    breed: "Husky",
    gender: "male",
    adoptable: true,
    size: "medium",
    photo: "https://upload.wikimedia.org/wikipedia/commons/thumb/f/ff/JAA_3538-2.jpg/220px-JAA_3538-2.jpg",
    color: "white, black",
    birth_date: Faker::Date.birthday(1, 9),
    admin_id: 1
  },
  { 
    location: "92111",
    name: Faker::Name.first_name,
    age: 4,
    title_age: "young",
    breed: "german shepard",
    gender: "female",
    adoptable: true,
    size: "large",
    photo: "http://cdn2-www.dogtime.com/assets/uploads/gallery/german-shepherd-dog-breed-pictures/standing-7.jpg",
    color: "black",
    birth_date: Faker::Date.birthday(1, 9),
    admin_id: 1
  }
])

p "Created #{Admin.count} Admins"
p "Created #{Dog.count} Dogs"
