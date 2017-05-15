class SearchsController < ApplicationController
  
  def index
    @dogs = Dog.where(nil)
    filter_params(params).each do |key, value|
      @dogs = @dogs.public_send(key, value) if value.present?
    end
  end

  private

    def filter_params(params)
      params.slice(:location, :breed, :title_age, :gender)
    end

end
