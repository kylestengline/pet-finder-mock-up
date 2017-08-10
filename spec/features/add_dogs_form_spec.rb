require "rails_helper"

RSpec.feature "Adding Dogs" do
  
  let(:admin) {Admin.create(email: "admin@example.com", password: "password")}

  before(:each) do
    login admin
  end

  scenario "an admin can add a dog" do
    visit root_path

    click_link "Post a Dog for Adoption"
    expect(page).to have_current_path new_admin_dog_path

    fill_in "Name of Dog", with: "Allen"
    fill_in "Age", with: 2
    find('.breed-color-group').fill_in "Breed", with: "Husky" 
    choose "dog_gender_male" 
    fill_in "Color", with: "black, white, gray"
    choose "dog_size_large"
    choose "dog_adoptable_true" 
    fill_in "EX: 01/2015", with: "11/15/2015"
    fill_in "Insert Photo URL Here", with: "http://3milliondogs.com/blog-assets-two/2014/08/corgicute.jpg" 
    fill_in "Location", with: "92603"
    choose "dog_title_age_baby"
    
    click_on "Create Dog"
    
    expect(page).to have_content "Dog added successfully."
    expect(page).to have_current_path admin_admins_path

  end

  scenario "an admin can not add a dog" do
    visit root_path

    click_link "Post a Dog for Adoption"
    expect(page).to have_current_path new_admin_dog_path

    fill_in "Name of Dog", with: ""
    fill_in "Age", with: "" 
    find('.breed-color-group').fill_in "Breed", with: ""
    choose "dog_gender_male" 
    fill_in "Color", with: ""
    choose "dog_size_large"
    choose "dog_adoptable_true" 
    fill_in "EX: 01/2015", with: ""
    fill_in "Photo", with: "" 
    fill_in "Location", with: ""
    choose "dog_title_age_baby"
    
    click_on "Create Dog"
    
    expect(page).to have_content "Dog not added."
    expect(page).to have_current_path admin_dogs_path

  end
end
