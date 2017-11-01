require 'rails_helper'

RSpec.describe Admin::DogsController, type: :controller do

  let(:admin) {Admin.create(email: "admin@example.com", password: "password")}
  let(:admin2) {Admin.create(email: "stuff@example.com", password: "passwords")}

  let(:dog) {Dog.create!(name: "Jill", age: 2, breed: "Corgi", title_age: "baby", 
                         gender: "female", location: "92603", adoptable: true, size: "small", 
                         photo: "https://upload.wikimedia.org/wikipedia/commons/thumb/f/ff/JAA_3538-2.jpg/220px-JAA_3538-2.jpg",
                         admin_id: admin.id
                        )}

  before(:each) do
    login_admin admin
  end

  describe "Actions for admins to create dogs" do

    context "#create" do
      #Must use params and not dog, b/c we're passing in params of dog
      #At least that's why I think I couldn't use dog in place of params
      it "allows admins to create new dogs" do
        post :create, params: { 
          dog: {
            name: "Jill",
            age: 2,
            breed: "Corgi",
            title_age: "baby",
            gender: "female",
            location: "92111",
            adoptable: true,
            size: "small",
            photo: "https://upload.wikimedia.org/wikipedia/commons/thumb/f/ff/JAA_3538-2.jpg/220px-JAA_3538-2.jpg",
            admin_id: admin.id
          }
        }
        expect(response).to redirect_to admin_admins_path
        expect(flash[:success]).to eq 'Dog added successfully.'
      end
    end

    context "#edit" do
      it "renders the edit dog page" do
        get :edit, params: { id: dog }
        expect(response).to render_template :edit
      end

      it "redirects to the index page with error message" do
        msg = "You can only edit the dog you posted"
        login_admin admin2
        get :edit, params: { id: dog }
        expect(response).to redirect_to admin_admins_path
        expect(flash[:danger]).to eq msg 
      end
    end

    context "#update" do
      let(:dog2) do
        { location: "92111", size: "medium" }
      end
      it "updates a dog and redirects to the show page" do
        put :update, params: { id: dog, :dog => dog2  }
        dog.reload
        expect(response).to redirect_to admin_admin_path(dog)
        expect(dog.location).to eq dog2[:location]
        expect(dog.size).to eq dog2[:size]
      end
    end
  end
end
