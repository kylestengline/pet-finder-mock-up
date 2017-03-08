# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

unless Admin.find_by( email: "stuff@things.com" )
  Admin.create!(
    email: "stuff@things.com",
    password: "password"
  )
end

Dog.create!([
  { 
    location: "92603",
    name: "Jill" ,
    age: 2 ,
    breed: "Corgi" ,
    gender: "female",
    adoptable: true,
    size: "small",
    photo: "http://3milliondogs.com/blog-assets-two/2014/08/corgicute.jpg",
    color: "white, black, orange",
    birth_date: "11/2/2015" 
  },
  { 
    location: "92603",
    name: "Jack" ,
    age: 7,
    breed: "Husky" ,
    gender: "male",
    adoptable: true,
    size: "small",
    photo: "https://upload.wikimedia.org/wikipedia/commons/thumb/f/ff/JAA_3538-2.jpg/220px-JAA_3538-2.jpg",
    color: "white, black",
    birth_date: "11/2/2010" 
  }
])

p "Created #{Admin.count} Admins"
p "Created #{Dog.count} Dogs"
