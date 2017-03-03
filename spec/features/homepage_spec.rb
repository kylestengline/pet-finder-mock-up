require 'rails_helper'

RSpec.feature "Showing content on the homepage" do

  scenario "a non signed in user can visit the homepage and select dog types" do
    visit root_path

    expect(page).to have_link "Sign In"

    expect(page).to have_content "Welcome To Dog Finder"
    expect(page).to have_link "Find A Dog To Adopt"
    expect(page).to have_link "About Dog Adoption"
    expect(page).to have_link "Dog Care"
    expect(page).to have_link "Shelters and Rescues"
    expect(page).to have_link "Helping Dogs"

    expect(page).to have_content "Location"
    expect(page).to have_content "Type"
    expect(page).to have_content "Breed"
    expect(page).to have_content "Age"
    expect(page).to have_content "Gender"

    expect(page).to have_button "Find Dogs"

  end
end
