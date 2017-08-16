class AdminMailer < Devise::Mailer
  helper :application # gives access to all helpers defined within `application_helper`.
  include Devise::Controllers::UrlHelpers # Optional. eg. `confirmation_url`

  default from: "no-reply@dogseekers.herokuapp.com"

  def confirmation_instructions(record, token, opts={})
    headers["Custom-header"] = "Welcome to Dog Seekers"
    opts[:from] = "no-reply@dogseekers.herokuapp.com" 
    opts[:reply_to] = "no-reply@dogseekers.herokuapp.com"
    super
  end

  def password_change(record, token, opts={})
    headers["Custom-header"] = "Confirmation of password change"
    opts[:from] = ENV["ADMIN_EMAIL"]
    opts[:reply_to] = ENV["ADMIN_EMAIL"]
    super
  end

  def create_dog_email(dog)
    @dog = dog
    #Production
    @admin_dogs_url = "https://dogseekers.herokuapp.com/admin/admins"
    #@admin_dogs_url = "http://localhost:3000/admin/admins" 
    mail(to: @dog.email, subject: "You just added a new dog for adoption.")
  end
  
  def update_dog_email(dog)
    @dog = dog
    #Production
    @admin_dogs_url = "https://dogseekers.herokuapp.com/admin/admins"
    #@admin_dogs_url = "http://localhost:3000/admin/admins" 
    mail(to: @dog.email, subject: "You just updated one of your dogs.")
  end

end
