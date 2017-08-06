class Admin::AdminsController < ApplicationController
  before_action :authenticate_admin!

  def index
    @admins_dogs = Dog.where(admin_id: current_admin.id)
  end

  def show
    @admin_dog = Dog.find(params[:id])
  end

  def create 
    @admin = Admin.new(params[:admin])

    respond_to do |format|
      if @admin.save 
        AdminMailer.welcome_email(@admin).deliver_now
        format.html { redirect_to(@admin, notice: 'Admin was successfully created.') }
        format.json { render json: @admin, status: :created, location: @admin }
      else
        format.html { redirect_to new_admin_registration_path }
        format.json { render json: @admin.errors, status: :unprocessable_entity }
      end
    end
  end

end
