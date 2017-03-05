require "rails_helper"

RSpec.feature "Searching for dogs" do

  let(:dog) {Dog.create(name: "Jill", age: 2, breed: "Corgi", 
                        adoptable: true, color: "white, black, orange", 
                        size: "small", birth_date: "11/2/2015", gender: "female",
                        photo: "http://3milliondogs.com/blog-assets-two/2014/08/corgicute.jpg" )}

  scenario "a perspective adopter can search for dogs" do
    visit root_path

    click_link "Find A Dog To Adopt"
    expect(page).to have_current_path(dogs_path)

    fill_in "Location", with: "92603"
    fill_in "Breed", with: dog.breed
    fill_in "Age", with: dog.age
    fill_in "Gender", with: dog.gender

    click_button "Find Dogs"
    expect(page).to have_current_path(dog_path(dog.id))
  end
end
