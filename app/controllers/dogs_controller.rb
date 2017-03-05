class DogsController < ApplicationController

  def index
    
  end

  def show
    @dogs = Dog.all
  end
end
