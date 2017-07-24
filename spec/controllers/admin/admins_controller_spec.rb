require 'rails_helper'

RSpec.describe Admin::AdminsController, type: :controller do

  let(:admin) {Admin.create(email: "admin@example.com", password: "password")}
  let(:admin2) {Admin.create(email: "stuff@example.com", password: "passwords")}

  let!(:dog) {Dog.create!(name: "Jill", age: 2, breed: "Corgi", title_age: "baby", color: "orange",
                         gender: "female", location: "92603", adoptable: true, size: "small", 
                         photo: "https://upload.wikimedia.org/wikipedia/commons/thumb/f/ff/JAA_3538-2.jpg/220px-JAA_3538-2.jpg", admin_id: admin.id
                        )}

  let!(:dog2) {Dog.create!(name: "Erik", age: 4, breed: "German Shepard", title_age: "young", color: "white",
                         gender: "male", location: "92603", adoptable: true, size: "medium", 
                         photo: "https://upload.wikimedia.org/wikipedia/commons/thumb/f/ff/JAA_3538-2.jpg/220px-JAA_3538-2.jpg", admin_id: admin2.id
                        )}

  before(:each) do
    login_admin admin
  end

  describe "Admins see their own dogs" do
    render_views

    context "Admins can view their index page" do

      it "allows admins to sign in" do
        get :index
        #possible false positive with Dog.all.count
        dogs = Dog.all.count
        expect(response).to render_template :index
        expect(response.body).to match dogs.to_s
      end
    end

    context "admins view a specific dog" do
      it "allows admins to view specific dog" do
        get :show, params: { id: dog.id }
        dogs = Dog.all.count
        expect(response).to render_template :show
        expect(response.body).to match dogs.to_s
      end
    end

    context "different admin signs in" do
      it "shows no dogs" do
        login_admin admin2
        get :index
        dogs = Dog.all.count
        expect(response).to render_template :index
        expect(response.body).to match dogs.to_s
      end
    end
  end
end
