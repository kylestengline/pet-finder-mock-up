class SearchsController < ApplicationController
  
  def index
    if params[:searchs]
      @dogs = Dog.search(params[:searchs]).order("#{@dogs.age}")
    else
      @dogs = Dog.all.order("created_at DESC")
    end
    @dog_search = Dog.search(params[:location], params[:breed], params[:age], params[:gender]).all
  end
end
