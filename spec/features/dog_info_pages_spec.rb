require "rails_helper"

RSpec.feature "Dog Info Pages" do

  let!(:breed) {
    Breed.create(name: "Beagle", photo: "http://cdn3-www.dogtime.com/assets/uploads/2011/01/file_23012_beagle.jpg",
                           description: "Small, compact, and hardy, Beagles are active companions for kids and adults alike. Canines in this dog breed are merry and fun loving, but being hounds, they can also be stubborn and require patient, creative training techniques. Their noses guide them through life, and they’re never happier than when following an interesting scent. The Beagle originally was bred as a scenthound to track small game, mostly rabbits and hare. He is still used for this purpose in many countries, including the United States."
              )}

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
    expect(page).to have_selector('th', text: 'Cost of Adoption')

  end

  scenario "renders the dog breeds page" do

    click_link "Dog Breeds"

    expect(page).to have_current_path breeds_path
    expect(page).to have_selector('h1', text: 'Dog Breeds')
    expect(page).to have_link breed.name
    expect(page).to have_xpath "//img[contains(@src,'#{File.basename(breed.photo)}')]"
    expect(page).to have_content breed.description.truncate(200)
    
  end
  
  scenario "renders the bring a dog home page" do

    click_link "Home Care"

    expect(page).to have_current_path dog_home_info_path
    expect(page).to have_selector('h1', text: 'Bringing a Dog Home')
    expect(page).to have_selector('th', text: 'How to Bring a dog home')
    expect(page).to have_selector('th', text: 'Application Info')
    expect(page).to have_selector('th', text: 'How To Prepare Your Dog for Home')
    expect(page).to have_selector('th', text: 'How To Prepare Your Home for a Dog')
    
  end

  scenario "renders the training your dog page" do

    click_link "Dog Training"

    expect(page).to have_current_path training_info_path
    expect(page).to have_selector('h1', text: 'Dog Training')
    expect(page).to have_selector('th', text: 'Training Your Dog')
    expect(page).to have_selector('th', text: 'How To Train Your Dog')
    expect(page).to have_selector('th', text: 'Who To Contact To Get Training Help')
    expect(page).to have_selector('th', text: 'Basic Dog Training Techniques')
    
  end

  scenario "renders dog problems page" do

    click_link "Dog Problems"

    expect(page).to have_current_path problems_info_path
    expect(page).to have_selector('h1', text: 'Doggie Troubles')
    expect(page).to have_selector('th', text: 'Troubles With Your New Pet')
    expect(page).to have_selector('th', text: 'How To Handle A Troublesome Dog')
    expect(page).to have_selector('th', text: 'Who To Contact')
    expect(page).to have_selector('th', text: 'Where To Get Your Dog Trained')
    
  end

  scenario "renders dog grooming page" do

    click_link "Dog Grooming"

    expect(page).to have_current_path grooming_info_path
    expect(page).to have_selector('h1', text: 'Grooming Your Dog')
    expect(page).to have_selector('th', text: 'How To Groom Your Dog')
    expect(page).to have_selector('th', text: 'Where To Get Your Dog Groomed')
    expect(page).to have_selector('th', text: 'When To Groom')
    expect(page).to have_selector('th', text: 'Best Practices for Grooming')
    
  end

  scenario "renders dog care videos page" do

    click_link "Dog Care Videos"

    expect(page).to have_current_path videos_path
    expect(page).to have_selector('h1', text: 'Dog Videos and How To\'s')
    expect(page).to have_selector('th', text: 'Training Your Dog')
    expect(page).to have_selector('th', text: 'When To Train Your Dog')
    expect(page).to have_selector('th', text: 'Getting Training Help')
    expect(page).to have_selector('th', text: 'Training Tutorial')
    expect(page).to have_selector('iframe')
    
  end

  scenario "renders getting involved with dog adoption page" do

    click_link "Get Involved"

    expect(page).to have_current_path get_involved_path
    expect(page).to have_selector('h1', text: 'How To Help With Dog Adoption')
    expect(page).to have_selector('th', text: 'How To Help With Dog Adoption')
    expect(page).to have_selector('th', text: 'Adoption Info')
    expect(page).to have_selector('th', text: 'Who To Contact')
    expect(page).to have_selector('th', text: 'How To Donate')
    
  end
end
