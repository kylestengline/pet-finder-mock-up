require "rails_helper"

RSpec.feature "Signing Admins In" do
  
  let!(:admin) {Admin.create!(email: "me@example.com", password: "password")}

  scenario "Admins can Sign in" do
    visit root_path

    click_link "Sign In"
    fill_in "Email", with: admin.email
    fill_in "Password", with: admin.password
    click_button "Log in"

    expect(page).to have_content "Signed in successfully."
    expect(page).to have_current_path root_path
    expect(page).to have_content "Sign Out"

  end

end
