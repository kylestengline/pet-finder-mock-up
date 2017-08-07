class Admin::DogsController < ApplicationController
  before_action :set_dog, only: [:edit, :update]
  before_action :authenticate_admin!

  def new
    @dog = Dog.new
  end

  def create 
    @dog = Dog.new(dog_params)
    @dog.admin_id = current_admin.id
    if @dog.save
      @admin = current_admin
      AdminMailer.create_dog_email(@admin).deliver_now
      flash[:success] = "Dog added successfully."
      redirect_to admin_admins_path
    else
      flash.now[:danger] = "Dog not added."
      render :new
    end
  end

  def edit
    if @dog.admin_id != current_admin.id
      flash[:danger] = "You can only edit the dog you posted"
      redirect_to admin_admins_path
    end
  end

  def update
    if @dog.admin_id != current_admin.id
      flash[:danger] = "You can only edit the dog you posted"
      redirect_to admin_admins_path
    else
      if @dog.update(dog_params)
        @admin = current_admin
        AdminMailer.update_dog_email(@admin).deliver_now
        flash[:success] = "Dog successfully updated"
        redirect_to admin_admin_path(@dog)
      else
        flash.now[:danger] = "Dog unsuccessfully updated"
        render :edit
      end
    end
  end

  private

    def dog_params
      params.require(:dog)
        .permit(:name, :age, :breed, :gender, :adoptable,
                :color, :size, :photo, :location, :title_age, :birth_date)
    end

    def set_dog
      @dog = Dog.find(params[:id])
    end
end
