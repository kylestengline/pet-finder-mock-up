class AdminMailerPreview < ActionMailer::Preview

  def confirmation_instructions
    AdminMailer.confirmaton_instructions(Admin.first, "faketoken", {})
  end

  def welcome_email
    AdminMailer.welcome_email(Admin.first)
  end

end
