require "rails_helper"

RSpec.feature "Users can search for dogs" do
  let(:dog) {Dog.create(name: "Jill", age: 2, breed: "Corgi", title_age: "baby", gender: "female", location: "92603" )}

  scenario "dog search returns users search params" do
    visit root_path

    click_link "Find A Dog To Adopt"

    expect(page).to have_current_path dogs_path
    
    fill_in "Zip Code", with: dog.location
    fill_in "Breed", with: dog.breed
    page.choose dog.title_age
    fill_in "Dog Gender", with: dog.gender
    click_button "Search for Dogs"

    expect(page).to have_content dog.name
    expect(page).to have_content dog.age
    expect(page).to have_link "Home Page"
    expect(page).to have_content dog.breed
  end
end
