require 'rails_helper'

RSpec.describe SearchsController, type: :controller do

  let!(:dog) {Dog.create!(name: "Jill", age: 2, breed: "Corgi", location: "92603",
                        adoptable: true, color: "white, black, orange", title_age: "baby",
                        size: "small", birth_date: "11/2/2015", gender: "female",
                        photo: "http://3milliondogs.com/blog-assets-two/2014/08/corgicute.jpg" )}

  describe '#searchs' do
    it 'should return results' do
      get :search => { "location" => dog.location, "age" => dog.age, "breed" => dog.breed, "gender" => dog.gender }
      response.should be_ok
      @dogs.map(&:name).should == [dog.name]
    end
  end

end
