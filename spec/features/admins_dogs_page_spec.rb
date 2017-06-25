require "rails_helper"

RSpec.feature "Admins Dog Page" do

  let(:admin) {Admin.create(email: "admin@example.com", password: "password")}
  let(:admin2) {Admin.create(email: "admin2@example.com", password: "password2")}
  let(:admin3) {Admin.create(email: "admin3@example.com", password: "password3")}

  let!(:dog) {Dog.create(name: "Jill", age: 2, breed: "Corgi", title_age: "baby", birth_date: "11/12/2015",
                       gender: "female", location: "92603", adoptable: true, size: "small", color: "white, orange",
                       photo: "https://upload.wikimedia.org/wikipedia/commons/thumb/f/ff/JAA_3538-2.jpg/220px-JAA_3538-2.jpg", admin_id: admin.id 
                   )}

  let!(:dog2) {Dog.create(name: "Henry", age: 5, breed: "Bulldog", title_age: "young", birth_date: "11/12/2012",
                       gender: "male", location: "92111", adoptable: true, size: "medium", color: "white",
                       photo: "https://vetstreet.brightspotcdn.com/dims4/default/e23e4d4/2147483647/thumbnail/645x380/quality/90/?url=https%3A%2F%2Fvetstreet-brightspot.s3.amazonaws.com%2F1f%2F92%2Feb11c793404c89e0cab23d9da64a%2FAP-0RHRMQ-ph645080113.jpg", admin_id: admin2.id 
                   )}

  scenario "personalized admin page for showing all dogs" do
    login admin

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

  scenario "personalized admin page for showing all dogs" do
    visit root_path

    click_link "Sign In"
    fill_in "Email", with: admin2.email
    fill_in "Password", with: admin2.password
    click_button "Login"

    click_link "All Dogs"
    expect(page).to have_selector("h1", text: "Showing All Dogs for #{ admin2.email }")
    expect(page).to have_content dog2.name
    expect(page).to have_content dog2.age
    expect(page).to have_content dog2.breed
    expect(page).to have_content dog2.title_age.titleize
    expect(page).to have_xpath "//img[contains(@src,'#{File.basename(dog2.photo)}')]"

    expect(page).to have_current_path admin_admins_path
    click_link "Sign Out"
  end

  scenario "personalized admin page has no dogs to display" do
    visit root_path

    click_link "Sign In"
    fill_in "Email", with: admin3.email
    fill_in "Password", with: admin3.password
    click_button "Login"

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
