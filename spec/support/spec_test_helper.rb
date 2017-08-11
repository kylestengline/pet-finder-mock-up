def last_email
  ActionMailer::Base.deliveries.last
end

def login(admin)
  admin = Admin.create(email: "admin@example.com", password: "password")

  #confirmation email sent
  #grabbing confirm token in order to sign in
  confirm = last_email.body.match(/confirmation_token=\w*/)
  visit "/admins/confirmation?#{confirm}"

  fill_in "Email", with: admin.email
  fill_in "Password", with: admin.password
  click_button "Login"
end

def signin(admin)
  click_link "Sign In"

  fill_in "Email", with: admin.email
  fill_in "Password", with: admin.password
  click_button "Login"
end

def search_for_dogs
  dog = Dog.create!(name: "Jill", age: 2, breed: "Corgi", title_age: "baby", birth_date: "11/12/2015",
                         gender: "female", location: "92603", adoptable: true, size: "small", color: "white, orange",
                         photo: "https://upload.wikimedia.org/wikipedia/commons/thumb/f/ff/JAA_3538-2.jpg/220px-JAA_3538-2.jpg", admin_id: admin.id
                   )

  visit root_path

  fill_in "Zip Code", with: dog.location
  fill_in "Breed", with: dog.breed
  choose 'title_age_baby' 
  fill_in "Dog Gender", with: dog.gender
  click_button "Search for Dogs"
end
