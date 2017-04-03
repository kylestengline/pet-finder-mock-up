require 'rails_helper'

RSpec.describe Admin::DogsController, type: :controller do

  before(:each) do
    login_as admin
    @photo = fixture_file_upload("files/corgi.jpg", "image/jpg")
  end

  describe "POST create" do
    let(:admin) {Admin.create(email: "admin@example.com", password: "password")}

    context "as a signed in admin" do
      it "allows admins to post new dogs" do
        post :create, dog: FactoryGirl.attributes_for(:dog)  
      end
    end
  end

end
