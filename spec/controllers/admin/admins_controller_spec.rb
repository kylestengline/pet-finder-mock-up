require 'rails_helper'

RSpec.describe Admin::AdminsController, type: :controller do

  let(:admin) {Admin.create(email: "admin@example.com", password: "password")}
  let(:admin2) {Admin.create(email: "stuff@example.com", password: "passwords")}

  let(:dog) {Dog.create!(name: "Jill", age: 2, breed: "Corgi", title_age: "baby", color: "orange",
                         gender: "female", location: "92603", adoptable: true, size: "small", 
                         photo: "https://upload.wikimedia.org/wikipedia/commons/thumb/f/ff/JAA_3538-2.jpg/220px-JAA_3538-2.jpg", admin_id: admin.id
                        )}

  let(:dog2) {Dog.create!(name: "Erik", age: 4, breed: "German Shepard", title_age: "young", color: "white",
                         gender: "male", location: "92603", adoptable: true, size: "medium", 
                         photo: "https://upload.wikimedia.org/wikipedia/commons/thumb/f/ff/JAA_3538-2.jpg/220px-JAA_3538-2.jpg", admin_id: admin2.id
                        )}

  before(:each) do
    login_admin admin
    @dog_params = FactoryGirl.build(:dog).attributes
  end

  describe "Admins see their own dogs" do

    context "Admins can view their index page" do
      it "allows admins to sign in" do
        get :index
        expect(response).to render_template :index
        expect(response).to have_selector @dog_params, count: 1
      end
    end

skip    context "admins view a specific dog" do
      it "allows admins to view specific dog" do
        get :show, params: { id: dog.id }
        expect(response).to render_template :show
        expect(response).to have_selector dog, count: 1
      end
    end

skip    context "different admin signs in" do
      it "shows no dogs" do
        login_admin admin2
        get :index
        expect(response).to have_selector @dog_params, count: 0
      end
    end
  end
end
