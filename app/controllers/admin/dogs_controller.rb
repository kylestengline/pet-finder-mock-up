class Admin::DogsController < ApplicationController
  before_action :authenticate_admin!, except: [:index, :show]

  before_action :set_dog, only: [:show, :edit, :update]

  def index
    @dogs = Dog.all
  end

  def show
    @admin_dogs = Dog.where(admin_id: params[:id])
  end

  def new
    @dog = Dog.new
  end

  def create 
    @dog = Dog.new(dog_params)
    @dog.admin_id = current_admin.id
    if @dog.save
      flash[:success] = "Dog added successfully."
      redirect_to admin_dogs_path
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
