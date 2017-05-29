require 'rails_helper'

RSpec.describe DogsController, type: :controller do

  let(:admin) {Admin.create(email: "admin@example.com", password: "password")}

  let(:dog) {Dog.create!(name: "Jill", age: 2, breed: "Corgi", title_age: "baby", 
                         gender: "female", location: "92603", adoptable: true, size: "small", 
                         photo: "https://upload.wikimedia.org/wikipedia/commons/thumb/f/ff/JAA_3538-2.jpg/220px-JAA_3538-2.jpg", admin_id: admin.id
                        )}

  describe "non-signed in users can access the index and show pages" do

    before(:each) do
      expect(response).to have_http_status(200)
    end

    context "#index" do
      it "allows users to navigate the index page" do
        get :index
      end
    end

    context "#show" do
      it "renders the show page for dogs" do
        get :show, params: { id: dog.id }
      end
    end

    context "#dogs_adoption" do
      it "renders more info about dog adoptions" do
        get :adoption
      end
    end

    context "#dog_breeds" do
      it "renders various dog breeds" do
        get :breeds
      end
    end

    context "#dog_breeds" do
      it "renders the info about bringing dogs home" do
        get :home
      end
    end

    context "#dog_training" do
      it "renders the info about bringing dogs home" do
        get :training
      end
    end

    context "#dog_problems" do
      it "renders the info about bringing dogs home" do
        get :problems
      end
    end

    context "#dogs_grooming" do
      it "renders the info about bringing dogs home" do
        get :grooming
      end
    end

    context "#videos" do
      it "renders the info about bringing dogs home" do
        get :videos
      end
    end

    context "#get_involved" do
      it "renders the how to get involved page"do
        get :involvement
      end
    end
  end
end
