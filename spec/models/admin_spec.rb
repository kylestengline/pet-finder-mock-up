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
end
