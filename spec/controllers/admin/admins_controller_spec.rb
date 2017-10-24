require 'rails_helper'

RSpec.describe Admin::AdminsController, type: :controller do

  let(:admin) {Admin.create(email: "admin@example.com", password: "password")}
  let(:admin2) {Admin.create(email: "stuff@example.com", password: "passwords")}

  let!(:dog) {Dog.create!(name: "Jill", age: 2, breed: "Corgi", title_age: "baby", color: "orange",
                         gender: "female", location: "92603", adoptable: true, size: "small", 
                         photo: "https://upload.wikimedia.org/wikipedia/commons/thumb/f/ff/JAA_3538-2.jpg/220px-JAA_3538-2.jpg",
                         admin_id: admin.id
                        )}

  let!(:dog2) {Dog.create!(name: "Erik", age: 4, breed: "German Shepard", title_age: "young", color: "white",
                         gender: "male", location: "92603", adoptable: true, size: "medium", 
                         photo: "https://upload.wikimedia.org/wikipedia/commons/thumb/f/ff/JAA_3538-2.jpg/220px-JAA_3538-2.jpg",
                         admin_id: admin2.id
                        )}

  before(:each) do
    login_admin admin
    expect(response).to have_http_status(:success)
  end

  describe "Admins see their own dogs" do
    render_views

    context "Admins index page" do
      it "allows admins to veiw their own dogs" do
        get :index
        expect(response).to render_template :index
        expect(response.body).to have_css "a[href='/admin/admins/#{dog.id}']"
      end
    end

    context "admins view a specific dog" do
      it "shows one dog" do
        get :show, params: { id: dog.id }
        expect(response).to render_template :show
        within "h1.show-admin-dogs" do
          expect(response).to have_css admin.email
        end
      end
    end

    context "when different admin signs in" do
      it "shows their dogs" do
        login_admin admin2
        get :index
        expect(response).to render_template :index
        expect(response.body).to have_css "a[href='/admin/admins/#{dog2.id}']"
      end
    end
  end
end
