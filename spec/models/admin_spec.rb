require 'rails_helper'

class Admin

  def confirmation_instructions
    AdminMailer.confirmation_instructions(self, 'faketoken', {}).deliver_now
  end

  def create_dog_email 
    AdminMailer.create_dog_email(self).deliver_now
  end

  def update_dog_email
    AdminMailer.update_dog_email(self).deliver_now
  end
end

RSpec.describe Admin, type: :model do
  let(:admin) { Admin.create!(email: "test@example.com", password: "password") }

  it "sends an email when a new admin signs up" do
    expect { admin.confirmation_instructions }
      .to change { ActionMailer::Base.deliveries.count }.by(2)
  end
  
  it "sends an email when dogs are created" do
    expect { admin.create_dog_email }
      .to change { ActionMailer::Base.deliveries.count }.by(2)
  end

  it "sends an email when dogs are updated" do
    expect { admin.update_dog_email }
      .to change { ActionMailer::Base.deliveries.count }.by(2)
  end

  it "is valid with attributes" do
    expect(Admin.new(email: "email@gmail.com", password: "password")).to be_valid
  end

  it "is invalid without attributes" do
    expect(Admin.new(email: "", password: "")).to_not be_valid
  end

  def filters
    bad_filter = LanguageFilter::Filter.new matchlist: :profanity
    sex_filter = LanguageFilter::Filter.new matchlist: :sex
  end

  it "filters bad language" do
    admin = Admin.new(email: "#{filters}", password: "password")
    expect(page).to have_content  :email, ": This kind of language is inappropriate." if filters.match?(admin.email)
  end
end
