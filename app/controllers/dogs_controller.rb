class DogsController < ApplicationController

  def index
    @dogs = Dog.all
  end

  def dogs_adoption
  end

  def show
    @dog = Dog.find(params[:id])
  end
end
