require "rails_helper"

RSpec.feature "Resend Confirmation Instructions" do

  let(:admin) {Admin.create(email: "admin@example.com", password: "password")}

  scenario "expiration link expires resends confirmation instructions to admins" do
    visit admin_confirmation_path

    expect(page).to have_selector('h2', text: 'Resend confirmation instructions')

    fill_in "Email", with: admin.email

    click_button "Resend confirmation instructions"
    expect(page).to have_content "You will receive an email with instructions for how to confirm your email address in a few minutes." 
  end

  scenario "expiration link expires resends confirmation instructions to admins" do
    visit admin_confirmation_path

    expect(page).to have_selector('h2', text: 'Resend confirmation instructions')

    fill_in "Email", with: ""

    click_button "Resend confirmation instructions"
    expect(page).to have_content "Email can't be blank" 
  end

end
