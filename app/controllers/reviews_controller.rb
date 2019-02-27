class ReviewsController < ApplicationController
  def new
  # GET "restaurants/38/reviews/new"
  	# we need @restaurant in our `simple_form_for`
    @restaurant = Restaurant.find(params[:restaurant_id])
    @review     = Review.new
  end

  def create
  # POST "restaurants/38/reviews"
  	@review     = Review.new(review_params)
  	@restaurant = Restaurant.find(params[:restaurant_id]) # new -> note: find within the database!
  	# WHAT NOT WORKS: 
  	# @review.restaurant = Restaurant.find(params[:restaurant_id])
  	# we have to create @restaurant

    # we need `restaurant_id` to asssociate review with corresponding restaurant
    @review.restaurant = @restaurant # new
    # SHOW of Restaurant -> @restaurant.reviews
    # example: yummy.restaurant = bristol (@review.restaurant = @restaurant) -> Set foreign key restaurant_id
    # yummy.restaurant : Should return the bristol restaurant
    # bristol.reviews : Should contain the yummy review
    # you can only get to the DB by doing Restaurant.find(x).reviews
     if @review.save
    	redirect_to restaurants_path
    else
    	render :new
    end
  end

  private

  def review_params
    params.require(:review).permit(:content, :rating)
  end
end


# class ReviewsController < ApplicationController
#   def new
#     # we need @restaurant in our `simple_form_for`
#     @restaurant = Restaurant.find(params[:restaurant_id])
#     @review = Review.new
#   end

#   def create
#     @review = Review.new(review_params)
#     # we need `restaurant_id` to asssociate review with corresponding restaurant
#     @review.restaurant = Restaurant.find(params[:restaurant_id])
#     @review.save
#   end

#   private

#   def review_params
#     params.require(:review).permit(:content)
#   end
# end