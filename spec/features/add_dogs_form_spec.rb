require "rails_helper"

RSpec.feature "Adding Dogs" do
  
  let(:admin) {Admin.create(email: "admin@example.com", password: "password")}

  before(:each) do
    login(admin)
  end

  scenario "an admin can add a dog" do
    visit root_path

    click_link "Add a Dog for Adoption"
    expect(page).to have_current_path new_admin_dog_path

    fill_in "Dogs Name", with: "Allen"
    fill_in "Age", with: 2
    fill_in "Breed", with: "Husky" 
    fill_in "Gender", with: "female" 
    fill_in "Color", with: "black, white, gray"
    fill_in "Size", with: "large"
    fill_in "Adoptable", with: true 
    fill_in "Birth Date", with: "11/15/2015"
    fill_in "Photo", with: "http://3milliondogs.com/blog-assets-two/2014/08/corgicute.jpg" 
    fill_in "Location", with: "92603"
    fill_in "Baby, Young or Adult", with: "Baby"
    
    click_on "Add Dog"
    
    expect(page).to have_content "Dog added successfully."
    expect(page).to have_current_path admin_dogs_path

  end

  scenario "an admin can not add a dog" do
    visit root_path

    click_link "Add a Dog for Adoption"
    expect(page).to have_current_path new_admin_dog_path

    fill_in "Dogs Name", with: ""
    fill_in "Age", with: "" 
    fill_in "Breed", with: "" 
    fill_in "Gender", with: "" 
    fill_in "Color", with: ""
    fill_in "Size", with: ""
    fill_in "Birth Date", with: ""
    fill_in "Photo", with: "" 
    fill_in "Location", with: ""
    fill_in "Baby, Young or Adult", with: ""
    
    click_on "Add Dog"
    
    expect(page).to have_content "Dog not added."
    expect(page).to have_current_path new_admin_dog_path

  end
end
