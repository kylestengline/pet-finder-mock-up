require 'rails_helper'

RSpec.describe Admin::DogsController, type: :controller do

  describe "POST #create" do
    let(:admin) {Admin.create(email: "admin@example.com", password: "password")}

    before (:each) do
      login_admin admin
    end

    context "as a signed in admin" do
      it "allows admins to create new dogs" do
        dog_params = FactoryGirl.build(:dog).attributes
        post :create, params: { dog: dog_params }
        expect(response).to redirect_to admin_dogs_path
      end
    end
  end
end
