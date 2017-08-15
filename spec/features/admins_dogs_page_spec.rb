require "rails_helper"

RSpec.feature "Admins Dog Page" do

  before(:each) do
    #confirm = last_email.body.match(/confirmation_token=\w*/)
    #visit "/admins/confirmation?#{confirm}"
  end

  scenario "personalized admin page for showing all dogs" do
    admin = Admin.create(email: "admin@example.com", password: "password")
    dog = Dog.create(name: "Jill", age: 2, breed: "Corgi", title_age: "baby", birth_date: "11/12/2015",
                       gender: "female", location: "92603", adoptable: true, size: "small", color: "white, orange",
                       photo: "https://upload.wikimedia.org/wikipedia/commons/thumb/f/ff/JAA_3538-2.jpg/220px-JAA_3538-2.jpg", admin_id: admin.id 
                   )

    login admin
    message = "Signed in successfully."
    expect(page).to have_content message

    visit root_path
    click_link "All Dogs"
    expect(page).to have_selector("h1", text: "Showing all dogs for #{ admin.email }")
    expect(page).to have_content dog.name
    expect(page).to have_content dog.age
    expect(page).to have_content dog.breed
    expect(page).to have_content dog.title_age.titleize
    expect(page).to have_xpath "//img[contains(@src,'#{File.basename(dog.photo)}')]"

    expect(page).to have_current_path admin_admins_path
    click_link "Sign Out"
  end

  scenario "personalized admin page for showing all dogs" do
    admin2 = Admin.create!(email: "admin2@example.com", password: "password2")
    login admin2

    click_link "All Dogs"
    expect(page).to have_selector("h1", text: "Showing all dogs for #{ admin2.email }")
    expect(page).to have_selector("h2", text: "#{admin2.email} hasn't posted any dogs yet.")

    expect(page).to have_current_path admin_admins_path
    click_link "Sign Out"
  end
end
