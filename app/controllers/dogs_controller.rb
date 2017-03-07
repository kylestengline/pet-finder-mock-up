class DogsController < ApplicationController

  def index
    @dogs = Dog.all
  end

  def search
  end

  def show
    @dog = Dog.find(params[:id])
  end
end
