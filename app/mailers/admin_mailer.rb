class AdminMailer < Devise::Mailer
  helper :application # gives access to all helpers defined within `application_helper`.
  include Devise::Controllers::UrlHelpers # Optional. eg. `confirmation_url`

  default from: ENV["ADMIN_EMAIL"]

  def confirmation_instructions(record, token, opts={})
    headers["Custom-header"] = "Welcome to Dog Seeker"
    opts[:from] = ENV["ADMIN_EMAIL"]
    opts[:reply_to] = ENV["ADMIN_EMAIL"]
    super
  end

  def password_change(record, token, opts={})
    headers["Custom-header"] = "Confirmation of password change"
    opts[:from] = ENV["ADMIN_EMAIL"]
    opts[:reply_to] = ENV["ADMIN_EMAIL"]
    super
  end

  def welcome_email(admin)
    @admin = admin
    #Production
    #@login_url = "https://dogseeker.herokuapp.com/sign_in" 
    @login_url = "http://localhost:3000/admins/sign_in" 
    mail(to: @admin.email, subject: "Welcome to Dog Seeker!")
  end

  def create_dog_email(dog)
    @dog = dog
    #Production
    #@admin_dogs_url = "https://dogseeker.herokuapp.com/admin/admins"
    @admin_dogs_url = "http://localhost:3000/admin/admins" 
    mail(to: @dog.email, subject: "You just added a new dog for adoption.")
  end
  
  def update_dog_email(dog)
    @dog = dog
    #Production
    #@admin_dogs_url = "https://dogseeker.herokuapp.com/admin/admins"
    @admin_dogs_url = "http://localhost:3000/admin/admins" 
    mail(to: @dog.email, subject: "You just updated one of your dogs.")
  end

end
