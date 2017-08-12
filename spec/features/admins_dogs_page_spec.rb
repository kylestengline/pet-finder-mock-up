require "rails_helper"

RSpec.feature "Admins Dog Page" do

  let!(:admin) {Admin.create(email: "admin@example.com", password: "password")}
  #let!(:admin2) {Admin.create!(email: "admin2@example.com", password: "password2")}
  let!(:admin3) {Admin.create(email: "admin3@example.com", password: "password3")}

  let!(:dog) {Dog.create(name: "Jill", age: 2, breed: "Corgi", title_age: "baby", birth_date: "11/12/2015",
                       gender: "female", location: "92603", adoptable: true, size: "small", color: "white, orange",
                       photo: "https://upload.wikimedia.org/wikipedia/commons/thumb/f/ff/JAA_3538-2.jpg/220px-JAA_3538-2.jpg", admin_id: admin.id 
                   )}

  before(:each) do
    confirm = last_email.body.match(/confirmation_token=\w*/)
    visit "/admins/confirmation?#{confirm}"
  end

  scenario "personalized admin page for showing all dogs" do
    login admin
    puts page.body
    message = "Your email address has been successfully confirmed."
    expect(page).to have_content message

    visit root_path
    click_link "All Dogs"
    expect(page).to have_selector("h1", text: "Showing All Dogs for #{ admin.email }")
    expect(page).to have_content dog.name
    expect(page).to have_content dog.age
    expect(page).to have_content dog.breed
    expect(page).to have_content dog.title_age.titleize
    expect(page).to have_xpath "//img[contains(@src,'#{File.basename(dog.photo)}')]"

    expect(page).to have_current_path admin_admins_path
    click_link "Sign Out"
  end

 skip scenario "personalized admin page for showing all dogs" do
    login admin2

    click_link "All Dogs"
    expect(page).to have_selector("h1", text: "Showing All Dogs for #{ admin2.email }")
    expect(page).to have_selector("h2", text: "#{admin2.email} hasn't posted any dogs yet.")

    expect(page).to have_current_path admin_admins_path
    click_link "Sign Out"
  end

  scenario "personalized admin page has no dogs to display" do
    visit root_path
    sign_in admin3

    click_link "All Dogs"
    expect(page).to have_selector("h1", text: "Showing All Dogs for #{ admin3.email }")

    if !dog.present?
      expect(page).to have_content dog.name
      expect(page).to have_content dog.age
      expect(page).to have_content dog.breed
      expect(page).to have_content dog.title_age.titleize
      expect(page).to have_xpath "//img[contains(@src,'#{File.basename(dog.photo)}')]"
    else
      expect(page).to have_selector("h2", text: "#{admin3.email} hasn't posted any dogs yet. Follow this link to post a dog for adoption.")
    end
    expect(page).to have_current_path admin_admins_path
    click_link "Sign Out"
  end
end
