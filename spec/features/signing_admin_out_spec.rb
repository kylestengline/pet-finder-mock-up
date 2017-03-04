require "rails_helper"

RSpec.feature "Admins Can Sign Out" do
  
  let(:admin) {Admin.create!(email: "me@example.com", password: "password")}

  scenario "Signed in Admins can Sign out" do
    login(admin)

    visit root_path

    click_link "Sign Out"

    expect(page).to have_content "Signed out successfully."
    expect(page).to have_link "Sign In"
    expect(page).to have_link "Sign Up"
  
  end

end
