require "rails_helper"

RSpec.feature "Signing Users Up" do
  
  scenario "Admin Sign Up" do
    visit root_path

    click_link "Sign Up"
    fill_in "Email", with: "admin@me.com"
    fill_in "Password", with: "password"
    fill_in "Password confirmation", with: "password"
    click_button "Sign up"

    expect(page).to have_content "You have signed up successfully"
    expect(current_path).to eq root_path
    expect(page).to have_content "Sign Out"
  end

end
