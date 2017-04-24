require "rails_helper"

RSpec.feature "Users can search for dogs" do
  let(:dog) {Dog.create!(name: "Jill", age: 2, breed: "Corgi", title_age: "baby", 
                         gender: "female", location: "92603", adoptable: true, size: "small", 
                         photo: "https://upload.wikimedia.org/wikipedia/commons/thumb/f/ff/JAA_3538-2.jpg/220px-JAA_3538-2.jpg"
                        )}

  let(:dog2) {Dog.create!(name: "Jill", age: 3, breed: "St. Bernard", title_age: "adult", 
                         gender: "male", location: "92111", adoptable: true, size: "large", 
                         photo: "https://vetstreet.brightspotcdn.com/dims4/default/909c6d6/2147483647/thumbnail/645x380/quality/90/?url=https%3A%2F%2Fvetstreet-brightspot.s3.amazonaws.com%2Fe5%2Fb4%2Fca8e2af94c3883e042c1f610fec4%2Fsaint-bernard-ap-1fjqfu-645-x-380.jpg"
                        )}

  scenario "dog search returns users search params" do
    visit root_path

    click_link "Find A Dog To Adopt"

    expect(page).to have_current_path dogs_path
    
    fill_in "Zip Code", with: dog.location
    fill_in "Breed", with: dog.breed
    choose 'title_age_baby' 
    fill_in "Dog Gender", with: dog.gender
    click_button "Search for Dogs"

    expect(page).to have_content "Meet #{dog.name}"
    expect(page).to have_link dog.name
    expect(page).to have_content "She is #{dog.age} years old."
    expect(page).to have_content dog.breed
  end

  scenario "dog search returns no results" do
    visit root_path

    click_link "Find A Dog To Adopt"

    expect(page).to have_current_path dogs_path
    
    fill_in "Zip Code", with: dog2.location
    fill_in "Breed", with: dog2.breed
    choose 'title_age_baby' 
    fill_in "Dog Gender", with: dog2.gender
    click_button "Search for Dogs"

    expect(page).to have_content "No Dogs match your search criteria. Please try your search again"
    expect(page).to have_link "Search Again"
  end
end
