class SearchsController < ApplicationController
  
  def index
    if params[:search]
      @dogs = Dog.search(params[:search]).order("#{@dogs.age}")
    else
      @dogs = Dog.all.order("post_date DESC")
    end
    @dog_search = Dog.search(params[:location], params[:breed], params[:age], params[:gender]).all
  end
end
