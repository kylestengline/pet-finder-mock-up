class Admin::AdminsController < ApplicationController
  before_action :authenticate_admin!

  def index
    @admins_dogs = Dog.where(admin_id: current_admin.id)
  end

  def show
    @admin_dog = Dog.find(params[:id])
  end

end
