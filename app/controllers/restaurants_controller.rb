class RestaurantsController < ApplicationController

  before_action :set_restaurant, only: [:show]

  def index
  	@restaurants = Restaurant.all
  end

  def show
  end

  def new
  	@restaurant = Restaurant.new
  end

  def create
  	@restaurant = Restaurant.new(restaurant_params)
        # @restaurant = Restaurant.new(params[:restaurant])
    if @restaurant.save
      redirect_to restaurant_path(@restaurant) # @restaurant alone is also ok
    else
      render :new
    end
  end

  private 

  def restaurant_params
    params.require(:restaurant).permit(:name, :address, :phone_number, :category)
  end

  def set_restaurant
    @restaurant = Restaurant.find(params[:id])
    # Restaurant.find = Active Record method!
  end

end