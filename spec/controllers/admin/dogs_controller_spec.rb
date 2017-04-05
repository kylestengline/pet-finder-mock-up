require 'rails_helper'

RSpec.describe Admin::DogsController, type: :controller do

  describe "POST #create" do
    let(:admin) {Admin.create(email: "admin@example.com", password: "password")}

    before (:each) do
      login_admin admin
      @photo = fixture_file_upload("files/corgi.jpg", "image/jpg")
    end

    context "as a signed in admin" do
      it "allows admins to create new dogs" do
        dog_params = FactoryGirl.build(:dog) 
        post :create, dog: dog_params, photo: @photo
        expect(response).to redirect_to admin_dogs_path
      end
    end
  end
end
