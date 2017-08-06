class AdminMailer < Devise::Mailer
  helper :application # gives access to all helpers defined within `application_helper`.
  include Devise::Controllers::UrlHelpers # Optional. eg. `confirmation_url`

  default from: "dogseeker7@gmail.com"

  def confirmation_instructions(record, token, opts={})
    header["Custom-header"] = "Welcome to Dog Seeker"
    opts[:from] = "dogseeker7@gmail.com"
    opts[:reply_to] = "dogseeker7@gmail.com"
    super
  end

  def password_change(record, token, opts={})
    header["Custom-header"] = "Confirmation of password change"
    opts[:from] = "dogseeker7@gmail.com"
    opts[:reply_to] = "dogseeker7@gmail.com"
    super
  end

  def welcome_email(admin)
    @admin = admin
    #For PROD
    #@login_url = "https://dogseeker.herokuapp.com/sign_in" 
    @login_url = "http://localhost:3000/admins/sign_in" 
    mail(to: @admin.email, subject: "Welcome to Dog Seeker!")
  end

  def create_dog_email(dog)
    @dog = dog
    @admin_dogs_url = "https://dogseeker.herokuapp.com/admin/admins"
    mail(to: @dog.email, subject: "You just added a new dog for adoption")
  end
  
  def update_dog_email(dog)
    @dog = dog
    @admin_dogs_url = "https://dogseeker.herokuapp.com/admin/admins"
    mail(to: @dog.email, subject: "You just updated one of your dogs")
  end
end
