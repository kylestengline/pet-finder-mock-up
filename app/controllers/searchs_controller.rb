class SearchsController < ApplicationController
  
  def index
    @dogs = Dog.search_filter(params.slice(:location, :breed, :title_age, :gender))
  end

end
