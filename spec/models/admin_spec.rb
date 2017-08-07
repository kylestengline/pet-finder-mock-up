require 'rails_helper'

RSpec.describe Admin, type: :model do

  let(:admin) { Admin.create!(email: "test@testin.com", password: "password") }

  it "sends an email when a dog is created" do
    expect { admin.create_dog_email(admin) }
      .to change { ActionMailer::Base.deliveries.count }.by(1)
  end
end
