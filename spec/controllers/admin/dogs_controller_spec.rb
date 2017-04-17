require 'rails_helper'

RSpec.describe Admin::DogsController, type: :controller do

  let(:admin) {Admin.create(email: "admin@example.com", password: "password")}
  let(:admin2) {Admin.create(email: "stuff@example.com", password: "passwords")}

  let(:dog) {Dog.create!(name: "Jill", age: 2, breed: "Corgi", title_age: "baby", 
                         gender: "female", location: "92603", adoptable: true, size: "small", 
                         photo: "https://upload.wikimedia.org/wikipedia/commons/thumb/f/ff/JAA_3538-2.jpg/220px-JAA_3538-2.jpg", admin_id: admin.id
                        )}

  before(:each) do
    login_admin admin
    @dog_params = FactoryGirl.build(:dog).attributes
  end

  describe "Sign In" do
    it "allows admins to sign in" do
      get :index
      expect(response).to have_http_status(:success)
    end
  end

  describe "POST #create" do
    #Must use params and not dog, b/c we're passing in params of dog
    #At least that's why I think I couldn't use dog in place of params
    context "as a signed in admin" do
      it "allows admins to create new dogs" do
        post :create, params: { dog: @dog_params }
        expect(response).to redirect_to admin_dogs_path
      end
    end
  end

  describe "Get #edit" do
    context "an admin can edit their dog" do
      it "renders the edit dog page" do
        get :edit, params: { id: dog }
        expect(response).to render_template :edit
      end
    end

    context "an admin can only edit the dog they posted" do
      it "redirects to the index page with error message" do
        msg = "You can only edit the dog you posted"
        login_admin admin2
        get :edit, params: { id: dog }
        expect(response).to redirect_to admin_dogs_path
        expect(flash[:danger]).to eq msg 
      end
    end
  end

end
