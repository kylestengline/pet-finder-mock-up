class DogsController < ApplicationController

  def index
    @dogs = Dog.all
  end

  def show
    @dog = Dog.find(params[:id])
    @posted_by = Admin.find_by(id: @dog.admin_id)
  end

  def adoption
  end

  def home
  end

  def training
  end

  def problems
  end

  def grooming
  end

  def videos
  end

end
