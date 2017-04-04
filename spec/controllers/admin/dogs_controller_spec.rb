require 'rails_helper'

RSpec.describe Admin::DogsController, type: :controller do

  before(:each) do
    login_as admin
    @photo = fixture_file_upload("files/corgi.jpg", "image/jpg")
  end

  describe "POST create" do
    let(:admin) {Admin.create(email: "admin@example.com", password: "password")}

    context "as a signed in admin" do
      it "allows admins to create new dogs" do
        dog_params = FactoryGirl.attributes_for(:dog) 
        post :create, :dog => dog_params
        expect(response).to redirect_to admin_dogs_path
      end
    end
  end
end
