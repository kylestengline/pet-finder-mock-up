class DogsController < ApplicationController

  def index
    @dogs = Dog.all
    if params[:search]
      @dogs = Dog.search(params[:search]).order("#{@dogs.age}")
    else
      @dogs = Dog.all.order("created_at DESC")
    end
  end

  def show
    @dog = Dog.find(params[:id])
  end
end
