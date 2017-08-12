require "rails_helper"

RSpec.feature "Signing Admins In" do
  
  let!(:admin) {Admin.create!(email: "me@example.com", password: "password")}

  before(:each) do
    visit root_path
  end

  scenario "Admins can Sign in" do

    #click_link "Sign In"
    login admin
    #fill_in "Email", with: admin.email
    #fill_in "Password", with: admin.password
    #click_button "Login"

    expect(page).to have_content "Signed in successfully."
    expect(page).to have_current_path root_path
    expect(page).to have_content "Sign Out"
  end

  scenario "Admins can't sign in" do

    click_link "Sign In"

    fill_in "Email", with: ""
    fill_in "Password", with: ""
    click_button "Login"

    expect(page).to have_current_path new_admin_session_path
    expect(page).to have_content "Invalid Email or password"
    expect(page).to have_selector('h2', text: 'Login' )
    
  end
end
