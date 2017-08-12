require "rails_helper"

RSpec.feature "Signing Users Up" do
  
  scenario "Admin Sign Up" do
    visit root_path

    click_link "Sign Up"

    expect(page).to have_selector("h2", text: "Sign Up")

    fill_in "Email", with: "admin@me.com"
    fill_in "Password", with: "password"
    fill_in "Password confirmation", with: "password"
    click_button "Sign up"

    message = "A message with a confirmation link has been sent to your email address. Please follow the link to activate your account."
    expect(page).to have_content message
    expect(current_path).to eq root_path
    expect(page).to have_content "Sign Up"
    expect(page).to have_content "Sign In"
    expect(page).to have_content "Home"
  end

end
