# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
# # Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Dog.destroy_all
Breed.destroy_all

unless Admin.find_by(email: ENV["ADMIN_EMAIL"])
  Admin.destroy_all
  Admin.create!(
    email: ENV["ADMIN_EMAIL"],
    password: ENV["ADMIN_PASSWORD"],
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
  },
  { 
    location: "92117",
    name: Faker::Name.first_name,
    age: 8,
    title_age: "adult",
    breed: "Labrador",
    gender: "male",
    adoptable: true,
    size: "medium",
    photo: "https://upload.wikimedia.org/wikipedia/commons/2/26/YellowLabradorLooking_new.jpg",
    color: "beige",
    birth_date: Faker::Date.birthday(1, 9),
    admin_id: 1
  }
])

Breed.create([
  {
    name: "Corgi",
    photo: "http://cdn3-www.dogtime.com/assets/uploads/2011/01/file_23192_pembroke-welsh-corgi.jpg",
    description: "The Welsh Corgi is a small type of herding dog that originated in Wales. Two separate breeds are recognized: the Pembroke Welsh Corgi and the Cardigan Welsh Corgi. Historically, the Pembroke has been attributed to the influx of dogs alongside Flemish weavers from around the 10th century, while the Cardigan is attributed to the dogs brought with Norse settlers, in particular a common ancestor of the Swedish Vallhund. A certain degree of interbreeding between the two types has been suggested to explain the similarities between the two.",
    temperament: "Playful, Bold, Tenacious, Outgoing, Protective, Friendly",
    life_span: "12 – 14 years",
    height: "10 inches to 1 foot tall at the shoulder",
    weight: "Male: 22–31 lbs (10–14 kg), Female: 22–29 lbs (10–13 kg)"
  },
  {
    name: "Saint Bernard",
    photo: "https://vetstreet-brightspot.s3.amazonaws.com/e5/b4/ca8e2af94c3883e042c1f610fec4/saint-bernard-ap-1fjqfu-645-x-380.jpg",
    description: "Originally the Saint Bernard dog breed was used to guard the grounds of Switzerland’s Hospice Saint Bernard as well as to help find and save lost and injured travelers. Today the St. Bernard enjoys the comforts of family life in many homes across the world. He is versatile and excels in the show ring and in obedience trials, drafting (pulling a cart or wagon), and weight pulling competitions.",
    temperament: "Lively, Watchful, Gentle, Friendly, Calm",
    life_span: "8 – 10 years",
    height: "Male: 28–35 inches (70–90 cm), Female: 26–31 inches (65–80 cm)",
    weight: "140 – 260 lbs"
  },
  {
    name: "Schnauzer",
    photo: "http://static.ddmcdn.com/en-us/apl/breedselector/images/breed-selector/dogs/breeds/miniature-schnauzer_03_lg.jpg",
    description: "A dog breed who’s got it all in one small package: intelligence, affection, an extroverted temperament, humor, and a personality that’s twice as big as he is. Throw in that walrus moustache and quivering enthusiasm, and he’ll make you laugh every day. With a Miniature Schnauzer in the house, you’ll never be alone, not even when you go to the bathroom. He’s got personality-plus, and whether he’s bounding around ahead of you or curled up snoozing on your lap, you’ll never be bored with him around.",
    temperament: "Obedient, Intelligent, Alert, Fearless, Spirited, Friendly",
    life_span: "Miniature Schnauzer: 12 – 14 years, Giant Schnauzer: 7 – 10 years, Standard Schnauzer: 13 – 16 years",
    height: "Miniature Schnauzer: 12 – 14 in., Giant Schnauzer: 2.1 – 2.3 ft., Standard Schnauzer: 19 – 20 in",
    weight: "Miniature Schnauzer: 11 – 18 lbs, Giant Schnauzer: 75 – 95 lbs, Standard Schnauzer: 31 – 44 lbs"
  },
  {
    name: "Beagle",
    photo: "http://cdn3-www.dogtime.com/assets/uploads/2011/01/file_23012_beagle.jpg",
    description: "Small, compact, and hardy, Beagles are active companions for kids and adults alike. Canines in this dog breed are merry and fun loving, but being hounds, they can also be stubborn and require patient, creative training techniques. Their noses guide them through life, and they’re never happier than when following an interesting scent. The Beagle originally was bred as a scenthound to track small game, mostly rabbits and hare. He is still used for this purpose in many countries, including the United States.",
    temperament: "Even Tempered, Intelligent, Determined, Amiable, Gentle, Excitable",
    life_span: "12 – 15 years",
    height: "Male: 14–16 inches (36–41 cm), Female: 13–15 inches (33–38 cm)",
    weight: "Male: 22–24 lbs (10–11 kg), Female: 20–22 lbs (9–10 kg)"
  },
  {
    name: "Siberian Husky",
    photo: "https://www.askideas.com/media/23/Grey-And-White-Siberian-Husky.jpg",
    description: "The Siberian Husky is a beautiful dog breed with a thick coat that comes in a multitude of colors and markings. Their blue or multi-colored eyes and striking facial masks only add to the appeal of this breed, which originated in Siberia. It is easy to see why many are drawn to the Siberian’s wolf-like looks, but be aware that this athletic, intelligent dog can be independent and challenging for first-time dog owners. Huskies also put the “H” in Houdini and need a fenced yard that is sunk in the ground to prevent escapes.",
    temperament: "Outgoing, Intelligent, Alert, Gentle, Friendly",
    life_span: "12 – 15 years",
    height: "Female: 20–22 inches (50–56 cm), Male: 21–24 inches (54–60 cm)",
    weight: "Female: 35–51 lbs (16–23 kg), Male: 44–60 lbs (20–27 kg)"
  },
  {
    name: "Labrador Retriever",
    photo: "http://cdn2-www.dogtime.com/assets/uploads/gallery/labrador-retriever-dog-breed-pictures/labrador-retriever-dog-pictures-6.jpg",
    description: "The Labrador Retriever was bred to be both a friendly companion and a useful working dog breed. Historically, he earned his keep as a fisherman’s helper: hauling nets, fetching ropes, and retrieving fish from the chilly North Atlantic. Today’s Labrador Retriever is as good-natured and hard working as his ancestors, and he’s America’s most popular breed. These days the Lab works as a retriever for hunters, assistance dog to the handicapped, show competitor, and search and rescue dog, among other canine jobs.",
    temperament: "Outgoing, Intelligent, Gentle, Even Tempered, Trusting, Agile, Kind",
    life_span: "10 – 14 years",
    height: "Male: 22–24 inches (57–62 cm), Female: 22–24 inches (55–60 cm)",
    weight: "Male: 64–79 lbs (29–36 kg), Female: 55–71 lbs (25–32 kg)"
  },
  {
    name: "Golden Retriever",
    photo: "http://cdn.abclocal.go.com/content/creativecontent/images/cms/406006_1280x720.jpg",
    description: "The Golden Retriever is one of the most popular dog breeds in the U.S. The breed’s friendly, tolerant attitude makes him a fabulous family pet, and his intelligence makes him a highly capable working dog. Golden Retrievers excel at retrieving game for hunters, tracking, sniffing out drugs, and as therapy and assistance dogs. They’re also natural athletes, and do well in dog sports such as agility and competitive obedience.",
    temperament: "Intelligent, Reliable, Friendly, Trustworthy, Confident, Kind",
    life_span: "10 – 12 years",
    height: "Female: 20–22 inches (51–56 cm), Male: 22–24 inches (56–61 cm)",
    weight: "Female: 55–71 lbs (25–32 kg), Male: 65–75 lbs (30–34 kg)"
  },
  {
    name: "Pug",
    photo: "https://vetstreet.brightspotcdn.com/dims4/default/10dae76/2147483647/thumbnail/645x380/quality/90/?url=https%3A%2F%2Fvetstreet-brightspot.s3.amazonaws.com%2F3a%2F54%2F5ae8bfcc41b381c27a792e0dd891%2FAP-KWDHXS-645sm8113.jpg",
    description: "Pugs often are described as a lot of dog in a small space. These sturdy, compact dogs are a part of the American Kennel Club’s Toy group, and are known as the clowns of the canine world because they have a great sense of humor and like to show off. Originally bred to be a lap dog, the Pug thrives on human companionship.",
    temperament: "Playful, Stubborn, Docile, Charming, Quiet, Sociable, Attentive, Clever",
    life_span: "12 – 15 years",
    height: "Male: 12 in. (At the withers), Female: 10 in. (At the withers)",
    weight: "14 - 18 lbs"
  },
  {
    name: "Rotweiler",
    photo: "http://www.natur-server.de/Bilder/Hunde/UB/001/ub000081-rottweiler.jpg",
    description: "Rottweilers were originally dogs bred to drive cattle to market. Later they were used to pull carts for butchers. They were among the earliest police dogs and serve with honor in the military. Most important, they are popular family guardians and friends.",
    temperament: "Obedient, Devoted, Fearless, Courageous, Alert, Self-assured, Good-natured, Calm, Steady, Confident",
    life_span: "8 – 10 years",
    height: "Female: 22–25 inches (56–63 cm), Male: 24–27 inches (61–69 cm)",
    weight: "Female: 77–110 lbs (35–48 kg), Male: 110–130 lbs (50–60 kg)"
  },
  {
    name: "Bulldog",
    photo: "https://ichef-1.bbci.co.uk/news/660/cpsprodpb/B22F/production/_90551654_gettyimages-511711526.jpg",
    description: "Bulldogs originally were used to drive cattle to market and to compete in a bloody sport called bullbaiting. Today, they’re gentle companions who love kids. A brief walk and a nap on the sofa is just this dog breed‘s speed.",
    temperament: "Docile, Willful, Friendly, Gregarious",
    life_span: "8 – 10 years",
    height: "Female: 12–16 inches (31–40 cm), Male: 12–16 inches (31–40 cm)",
    weight: "Female: 40–51 lbs (18–23 kg), Male: 51–55 lbs (23–25 kg)"
  }
])

p "Created #{Admin.count} Admins"
p "Created #{Dog.count} Dogs"
p "Created #{Breed.count} Breeds"
