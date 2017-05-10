class DogsController < ApplicationController

  def index
    @dogs = Dog.all
  end

  def show
    @dog = Dog.find(params[:id])
  end

  def adoption
  end

  def breeds
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
