class DogsController < ApplicationController

  def index
    @dogs = Dog.all
    if params[:search]
      @dogs = Dog.search(params[:search]).order("#{@dogs.age}")
    else
      @dogs = Dog.all.order("created_at DESC")
    end
    @dog_search = Dog.search(params[:location], params[:breed], params[:age], params[:gender]).all
  end

  def search
  end

  def show
    @dog = Dog.find(params[:id])
  end
end
