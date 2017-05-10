require 'rails_helper'

RSpec.feature "Showing content on the homepage" do

  let(:admin) {Admin.create(email: "admin@example.com", password: "password")}

  scenario "a non signed in user can visit the homepage and select dog types" do
    visit root_path

    expect(page).to have_link "Sign In"

    expect(page).to have_content "Welcome To Dog Seeker"
    expect(page).to have_link "Find A Dog To Adopt"
    expect(page).to have_link "About Dog Adoption"
    expect(page).to have_link "Dog Care"
    expect(page).to have_link "Some of Our Pets"
    expect(page).to have_link "Helping Dogs"
    expect(page).to have_link "About Dog Seeker"

    expect(page).to have_selector('h1', text: 'Welcome To Dog Seeker')
  end

  scenario "the homepage has dropdown links on hover" do

    visit root_path

    expect(page).to have_link "More About Dog Adoption"
    expect(page).to have_link "Dog Breeds"
    expect(page).to have_link "Bring a Dog Home"
    expect(page).to have_link "Dog Training"
    expect(page).to have_link "Dog Problems"
    expect(page).to have_link "Dog Grooming"
    expect(page).to have_link "Dog Care Videos"
    expect(page).to have_link "See All Dogs"
    expect(page).to have_link "Get Involved"

  end

  scenario "a signed in user sees different links than non signed in users" do
    login admin

    visit root_path

    expect(page).to have_link "Sign Out"
    expect(page).to have_link "Post a Dog for Adoption"
    expect(page).to have_link "My Dogs"

    expect(page).to have_current_path root_path
  end
end

