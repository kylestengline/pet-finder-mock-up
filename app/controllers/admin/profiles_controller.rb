class Admin::ProfilesController < ApplicationController
  before_action :authenticate_admin!, except: [:index, :show]

  before_action :set_profile, only: [:show, :edit, :update]

  def index
    @profile = Profile
    @dogs = Dog.all
  end

  def show
  end

  def new
    @profile = Profile.new
  end

  def create 
    @profile = Profile.new(profile_params)
    if @profile.save
      flash[:success] = "Admin added successfully."
      redirect_to profile_admin_index
    else
      flash.now[:danger] = "Admin not added."
      render :new
    end
  end

  def edit
    if @profile.admin_id != current_admin.id
      flash[:danger] = "You can only edit the dog you posted"
      redirect_to profile_admin_index
    end
  end

  def update
    if @profile.admin_id != current_admin.id
      flash[:danger] = "You can only edit your own profile"
      redirect_to admin_dogs_path
    else
      if @profile.update(profile_params)
        flash[:success] = "Profile successfully updated"
        redirect_to profile_admin_index
      else
        flash.now[:danger] = "Profile unsuccessfully updated"
        render :edit
      end
    end
  end

  private

    def profile_params
      params.require(:admin)
        .permit(:email, :encrypted_password)
    end

    def set_profile
      @profile = Profile.find(params[:id])
    end
end
