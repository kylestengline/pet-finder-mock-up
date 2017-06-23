class Admin::AdminsController < ApplicationController

  def index
    @dogs = Dog.all
  end

  def show
    @admin_dog = Dog.where(admin_id: params[:id])
  end

end
