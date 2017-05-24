require "rails_helper"

RSpec.feature "Dog Info Pages" do

  before(:each) do
    visit root_path
  end

  scenario "renders the dog adoption page" do

    click_link "More About Dog Adoption"

    expect(page).to have_current_path adoption_info_path
    expect(page).to have_selector('h1', text: 'Dog Adoption Info')
    expect(page).to have_selector('th', text: 'How To Adopt')
    expect(page).to have_selector('th', text: 'Where To Adopt')
    expect(page).to have_selector('th', text: 'When To Adopt')

  end

  scenario "renders the dog breeds page" do

    click_link "Dog Breeds"

    expect(page).to have_current_path breeds_info_path
    expect(page).to have_selector('h1', text: 'Dog Breeds')
    expect(page).to have_selector('th', text: 'Various Breeds')
    expect(page).to have_selector('th', text: 'Where to find Different Breeds')
    expect(page).to have_selector('th', text: 'Breeders')
    
  end
  
  scenario "renders the bring a dog home page" do

    click_link "Bring a Dog Home"

    expect(page).to have_current_path dog_home_info_path
    expect(page).to have_selector('h1', text: 'More Info about bringing a Dog Home')
    expect(page).to have_selector('th', text: 'How to Bring a dog home')
    expect(page).to have_selector('th', text: 'Application Info')
    expect(page).to have_selector('th', text: 'Who to Contact')
    
  end

  scenario "renders the training your dog page" do

    click_link "Dog Training"

    expect(page).to have_current_path training_info_path
    expect(page).to have_selector('h1', text: 'Dog Training')
    expect(page).to have_selector('th', text: 'Training Your Dog')
    expect(page).to have_selector('th', text: 'How To Train Your Dog')
    expect(page).to have_selector('th', text: 'Who To Contact To Get Training Help')
    
  end

  scenario "renders dog problems page" do

    click_link "Dog Problems"

    expect(page).to have_current_path problems_info_path
    expect(page).to have_selector('h1', text: 'Doggie Troubles')
    expect(page).to have_selector('th', text: 'Having Trouble With Your New Pet?')
    expect(page).to have_selector('th', text: 'How To Handle A Troublesome Dog')
    expect(page).to have_selector('th', text: 'Who To Contact')
    
  end

  scenario "renders dog grooming page" do

    click_link "Dog Grooming"

    expect(page).to have_current_path grooming_info_path
    expect(page).to have_selector('h1', text: 'Grooming Your Dog')
    expect(page).to have_selector('th', text: 'How To Groom Your Dog')
    expect(page).to have_selector('th', text: 'Where To Get Your Dog Groomed')
    expect(page).to have_selector('th', text: 'When To Groom')
    
  end

  scenario "renders dog care videos page" do

    click_link "Dog Care Videos"

    expect(page).to have_current_path videos_path
    expect(page).to have_selector('h1', text: 'Dog Videos and How To\'s')
    expect(page).to have_selector('th', text: 'Training Your Dog')
    expect(page).to have_selector('th', text: 'When To Train Your Dog')
    expect(page).to have_selector('th', text: 'Who To Contact To Get Training Help')
    
  end

  scenario "renders getting involved with dog adoption page" do

    click_link "Get Involved"

    expect(page).to have_current_path get_involved_path
    expect(page).to have_selector('h1', text: 'How To Help With Dog Adoption')
    expect(page).to have_selector('th', text: 'How To Help With Dog Adoption')
    expect(page).to have_selector('th', text: 'Adoption Info')
    expect(page).to have_selector('th', text: 'Who To Contact')
    
  end
end
