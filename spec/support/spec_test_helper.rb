def login(admin)
  admin = Admin.create(email: "me@me.com", password: "password")

  visit root_path

  click_link "Sign In"
  fill_in "Email", with: admin.email
  fill_in "Password", with: admin.password
  click_button "Log in"
end
