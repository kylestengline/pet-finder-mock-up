require 'rails_helper'

RSpec.describe Dog, type: :model do

  let!(:admin) { Admin.create!(email: "test@example.com", password: "password") }
  let(:dog) {Dog.create(name: "Jill", age: 2, breed: "Corgi", title_age: "baby", 
                       gender: "female", location: "92603", adoptable: true, size: "small", 
                       photo: "https://upload.wikimedia.org/wikipedia/commons/thumb/f/ff/JAA_3538-2.jpg/220px-JAA_3538-2.jpg", admin_id: admin.id
                      )}

  it "validates dog with valid attributes" do
    expect(dog).to be_valid
  end

  it "is invalid without a dog name" do
    dog.name = nil
    expect(dog).to_not be_valid

  end
  it "is invalid without a breed name" do
    dog.breed = nil
    expect(dog).to_not be_valid
  end

  it "is invalid without an age" do
    dog.age = nil
    expect(dog).to_not be_valid
  end

  it "is invalid without a title age" do
    dog.title_age = nil
    expect(dog).to_not be_valid
  end

  it "is invalid without a gender" do
    dog.gender = nil
    expect(dog).to_not be_valid
  end

  it "is invalid when not specifying adoptable" do
    dog.adoptable = nil
    expect(dog).to_not be_valid
  end

  it "is invalid without a size" do
    dog.size = nil
    expect(dog).to_not be_valid
  end

  def setting_bad_filters
    bad_filters = LanguageFilter::Filter.new matchlist: :profanity
    dog.name = bad_filters.matchlist.pop
    dog.breed = bad_filters.matchlist.pop
    dog.birth_date = bad_filters.matchlist.pop
    dog.color = bad_filters.matchlist.pop
    dog.photo = bad_filters.matchlist.pop
  end

  it "filters bad language" do
    setting_bad_filters
    expect(dog).to_not be_valid
  end
end
