require 'rails_helper'

RSpec.describe SearchsController, type: :controller do

  let(:dog) {Dog.create(name: "Jill", age: 2, breed: "Corgi", 
                        adoptable: true, color: "white, black, orange", 
                        size: "small", birth_date: "11/2/2015", gender: "female",
                        photo: "http://3milliondogs.com/blog-assets-two/2014/08/corgicute.jpg" )}

  describe '#searchs' do
    it 'should return results' do
      get :search => { "location" => "92603", "age" => "2", "breed" => "Corgi", "gender" => "female" }
      response.should be_ok
      @dogs.map(&:name).should == ['Jill']
    end
  end

end
