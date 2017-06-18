require "rails_helper"

RSpec.feature "Admins Dog Page" do

  let(:admin) {Admin.create(email: "admin@example.com", password: "password")}

  scenario "personalized admin page for showing all dogs" do
    login admin

    click_link "My Dogs"
    expect(page).to have_selector("h1", text: "Showing All Dogs for #{ admin.email }")
    expect(page).to have_current_path admin_dogs_path
  end

end

