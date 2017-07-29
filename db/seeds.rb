# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
# # Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Dog.destroy_all
Admin.destroy_all

unless Admin.find_by( email: "stuff@things.com" )
  Admin.create(
    email: "stuff@things.com",
    password: "password",
    id: 1
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

Breed.create([
  {
    name: "Corgi",
    photo: "http://cdn3-www.dogtime.com/assets/uploads/2011/01/file_23192_pembroke-welsh-corgi.jpg",
    description: "The Welsh Corgi is a small type of herding dog that originated in Wales. Two separate breeds are recognized: the Pembroke Welsh Corgi and the Cardigan Welsh Corgi. Historically, the Pembroke has been attributed to the influx of dogs alongside Flemish weavers from around the 10th century, while the Cardigan is attributed to the dogs brought with Norse settlers, in particular a common ancestor of the Swedish Vallhund. A certain degree of interbreeding between the two types has been suggested to explain the similarities between the two."
  },
  {
    name: "Saint Bernard",
    photo: "https://vetstreet-brightspot.s3.amazonaws.com/e5/b4/ca8e2af94c3883e042c1f610fec4/saint-bernard-ap-1fjqfu-645-x-380.jpg",
    description: "Originally the Saint Bernard dog breed was used to guard the grounds of Switzerland’s Hospice Saint Bernard as well as to help find and save lost and injured travelers. Today the St. Bernard enjoys the comforts of family life in many homes across the world. He is versatile and excels in the show ring and in obedience trials, drafting (pulling a cart or wagon), and weight pulling competitions."
  },
  {
    name: "Schnauzer",
    photo: "https://s-media-cache-ak0.pinimg.com/736x/f9/8b/39/f98b39b04001f8fd26f4b352740c7125--schnauzer-haircuts-miniature-snauzer.jpg",
    description: "A dog breed who’s got it all in one small package: intelligence, affection, an extroverted temperament, humor, and a personality that’s twice as big as he is. Throw in that walrus moustache and quivering enthusiasm, and he’ll make you laugh every day. With a Miniature Schnauzer in the house, you’ll never be alone, not even when you go to the bathroom. He’s got personality-plus, and whether he’s bounding around ahead of you or curled up snoozing on your lap, you’ll never be bored with him around."
  },
  {
    name: "Beagle",
    photo: "http://cdn3-www.dogtime.com/assets/uploads/2011/01/file_23012_beagle.jpg",
    description: "Small, compact, and hardy, Beagles are active companions for kids and adults alike. Canines in this dog breed are merry and fun loving, but being hounds, they can also be stubborn and require patient, creative training techniques. Their noses guide them through life, and they’re never happier than when following an interesting scent. The Beagle originally was bred as a scenthound to track small game, mostly rabbits and hare. He is still used for this purpose in many countries, including the United States."
  },
  {
    name: "Siberian Husky",
    photo: "https://www.askideas.com/media/23/Grey-And-White-Siberian-Husky.jpg",
    description: "The Siberian Husky is a beautiful dog breed with a thick coat that comes in a multitude of colors and markings. Their blue or multi-colored eyes and striking facial masks only add to the appeal of this breed, which originated in Siberia. It is easy to see why many are drawn to the Siberian’s wolf-like looks, but be aware that this athletic, intelligent dog can be independent and challenging for first-time dog owners. Huskies also put the “H” in Houdini and need a fenced yard that is sunk in the ground to prevent escapes."
  },
  {
    name: "Labrador Retriever",
    photo: "http://cdn2-www.dogtime.com/assets/uploads/gallery/labrador-retriever-dog-breed-pictures/labrador-retriever-dog-pictures-6.jpg",
    description: "The Labrador Retriever was bred to be both a friendly companion and a useful working dog breed. Historically, he earned his keep as a fisherman’s helper: hauling nets, fetching ropes, and retrieving fish from the chilly North Atlantic. Today’s Labrador Retriever is as good-natured and hard working as his ancestors, and he’s America’s most popular breed. These days the Lab works as a retriever for hunters, assistance dog to the handicapped, show competitor, and search and rescue dog, among other canine jobs."
  },
  {
    name: "Golden Retriever",
    photo: "http://cdn.abclocal.go.com/content/creativecontent/images/cms/406006_1280x720.jpg",
    description: "The Golden Retriever is one of the most popular dog breeds in the U.S. The breed’s friendly, tolerant attitude makes him a fabulous family pet, and his intelligence makes him a highly capable working dog. Golden Retrievers excel at retrieving game for hunters, tracking, sniffing out drugs, and as therapy and assistance dogs. They’re also natural athletes, and do well in dog sports such as agility and competitive obedience."
  }
])

p "Created #{Admin.count} Admins"
p "Created #{Dog.count} Dogs"
p "Created #{Breed.count} Breeds"
