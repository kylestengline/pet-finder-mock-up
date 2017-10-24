require 'rails_helper'

RSpec.describe BreedsController, type: :controller do

  let!(:breed) { Breed.create(name: "Corgi",
                              photo: "http://cdn3-www.dogtime.com/assets/uploads/2011/01/file_23192_pembroke-welsh-corgi.jpg",
                              description: "The Welsh Corgi is a small type of herding dog that originated in Wales. Two separate breeds are recognized: the Pembroke Welsh Corgi and the Cardigan Welsh Corgi. Historically, the Pembroke has been attributed to the influx of dogs alongside Flemish weavers from around the 10th century, while the Cardigan is attributed to the dogs brought with Norse settlers, in particular a common ancestor of the Swedish Vallhund. A certain degree of interbreeding between the two types has been suggested to explain the similarities between the two."
                            )}


  describe "breeds pages" do
    render_views

    context "#index" do
      it "shows various breeds" do
        get :index
        expect(response).to render_template :index
        expect(response).to have_http_status 200
        expect(response.body).to have_css "a[href='/breeds/#{breed.id}']"
      end
    end

    context "#show" do
      it "shows a specific breed" do
        get :show, params: { id: breed.id }
        expect(response).to render_template :show
        expect(response).to have_http_status 200
        within "h2.dog-breed-name" do
          expect(response).to have_css breed.name
        end
      end
    end
  end
end
