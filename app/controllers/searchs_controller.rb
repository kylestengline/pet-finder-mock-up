class SearchsController < ApplicationController
  
  def index
    if params[:search]
      #@dogs = Dog.search(params[:search]).order("#{@dogs.age}")
      @dogs = Dog.search(params[:location], params[:breed], params[:age], params[:gender]).all
    else
      @dogs = Dog.all.order("age DESC")
    end
      @dog_search = Dog.search(params[:location], params[:breed], params[:age], params[:gender]).all
  end

end
