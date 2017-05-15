require 'rails_helper'

RSpec.feature "Showing Individual Dogs" do

  let!(:dog) {Dog.create(name: "Jill", age: 2, breed: "Corgi", title_age: "baby", birth_date: "11/12/2015",
                         gender: "female", location: "92603", adoptable: true, size: "small", color: "white, orange",
                         photo: "https://upload.wikimedia.org/wikipedia/commons/thumb/f/ff/JAA_3538-2.jpg/220px-JAA_3538-2.jpg"
                        )}

  scenario "users can view specific dogs" do

    visit root_path
    click_link "See All Dogs"
    click_link dog.name

    expect(page).to have_content dog.name
    expect(page).to have_content dog.age
    expect(page).to have_content dog.breed
    expect(page).to have_content dog.title_age
    expect(page).to have_content dog.location
    expect(page).to have_content dog.size
    expect(page).to have_xpath "//img[contains(@src,'#{File.basename(dog.photo)}')]"
    expect(page).to have_current_path dog_path(Dog.first)

  end
end
