require "rails_helper"

RSpec.describe AdminMailer, type: :mailer do

  describe "create dog email" do
    let(:admin) { Admin.create(email: "test@example.com", password: "password") }
    let(:mail) { described_class.create_dog_email(admin).deliver_now }

    it "renders the subject" do
      expect(mail.subject).to eq "You just added a new dog for adoption."
    end

    it "renders the receiver email" do
      expect(mail.to).to eq [admin.email]
    end

    it "renders the sender email" do
      expect(mail.from).to eq [ENV["ADMIN_EMAIL"]]
    end

    it "engages with a specific admin" do
      expect(mail.body.encoded).to match admin.email 
    end

    it "sends a confirmation url" do
      expect(mail.body.encoded)
        .to match admin_admins_path 
    end
  end

  describe "update dog email" do
    let(:admin) { Admin.create(email: "test@example.com", password: "password") }
    let(:mail2) { described_class.update_dog_email(admin).deliver_now }

    it "renders the subject" do
      expect(mail2.subject).to eq "You just updated one of your dogs."
    end

    it "renders the receiver email" do
      expect(mail2.to).to eq [admin.email]
    end

    it "renders the sender email" do
      expect(mail2.from).to eq [ENV["ADMIN_EMAIL"]]
    end

    it "engages with a specific admin" do
      expect(mail2.body.encoded).to match admin.email
    end

    it "sends a confirmation url" do
      expect(mail2.body.encoded)
        .to match admin_admins_path
    end
  end
end
