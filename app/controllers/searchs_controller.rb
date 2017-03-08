class SearchsController < ApplicationController
  
  def index
    if params[:search]
      #@dogs = Dog.search(params[:search]).order("#{@dogs.age}")
      @dogs = Dog.search(params[:location], params[:breed], params[:age], params[:gender]).all
    else
      @dogs = Dog.all.order("age ASC")
    end
  end

end
