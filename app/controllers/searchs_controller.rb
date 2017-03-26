class SearchsController < ApplicationController
  
  def index
    if params.has_key?(:location) || params.has_key?(:breed) || params.has_key?(:title_age) || params.has_key?(:gender)
      @dogs = Dog.search(params[:location], params[:breed], params[:title_age], params[:gender]).all
    else
      @dogs = Dog.all.order("age ASC")
    end
  end

end
