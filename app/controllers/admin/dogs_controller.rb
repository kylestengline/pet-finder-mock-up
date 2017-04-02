class Admin::DogsController < ApplicationController
  def index
  end

  def new
    @dog = Dog.new
  end

  def create 
    @dog = Dog.new(dog_params)
    if @dog.save
      flash[:success] = "Dog added successfully."
      redirect_to admin_dogs_path
    else
      flash.now[:danger] = "Dog not added."
      render :new
    end
  end


  private

    def dog_params
      params.require(:dog)
        .permit(:name, :age, :breed, :gender, :adoptable,
                :color, :size, :photo, :location, :title_age, :birth_date)
    end
end
