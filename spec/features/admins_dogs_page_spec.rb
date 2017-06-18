require "rails_helper"

RSpec.feature "Admins Dog Page" do

  let(:admin) {Admin.create(email: "admin@example.com", password: "password")}
  let(:admin2) {Admin.create(email: "admin2@example.com", password: "password2")}

  let!(:dog) {Dog.create(name: "Jill", age: 2, breed: "Corgi", title_age: "baby", birth_date: "11/12/2015",
                       gender: "female", location: "92603", adoptable: true, size: "small", color: "white, orange",
                       photo: "https://upload.wikimedia.org/wikipedia/commons/thumb/f/ff/JAA_3538-2.jpg/220px-JAA_3538-2.jpg",
                   )}

  scenario "personalized admin page for showing all dogs" do
    login admin

    click_link "My Dogs"
    expect(page).to have_selector("h1", text: "Showing All Dogs for #{ admin.email }")
    expect(page).to have_content dog.name
    expect(page).to have_content dog.age
    expect(page).to have_content dog.breed
    expect(page).to have_content dog.title_age.titleize
    expect(page).to have_xpath "//img[contains(@src,'#{File.basename(dog.photo)}')]"

    expect(page).to have_current_path admin_dogs_path
  end

  scenario "personalized admin page for showing all dogs" do
    visit root_path

    click_link "Sign In"
    fill_in "Email", with: admin2.email
    fill_in "Password", with: admin2.password
    click_button "Login"

    click_link "My Dogs"
    expect(page).to have_selector("h1", text: "Showing All Dogs for #{ admin2.email }")
    expect(page).not_to have_content dog.name
    expect(page).not_to have_content dog.age
    expect(page).not_to have_content dog.breed
    expect(page).not_to have_content dog.title_age.titleize
    expect(page).not_to have_xpath "//img[contains(@src,'#{File.basename(dog.photo)}')]"

    expect(page).to have_current_path admin_dogs_path
  end

end

