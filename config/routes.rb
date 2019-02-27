Rails.application.routes.draw do
	root to: 'restaurants#index'
	# controller/action
	resources :restaurants , only: [:create, :index, :new, :show] do
		resources :reviews, only: [ :new, :create ]
		# you can do @restaurant = Restaurant.find(params[:restaurant_id] because of this inheritance
		# note: params represent the URL, form and query
  end
end

# rails routes 

    #                    Prefix Verb URI Pattern                                                                              Controller#Action
    #                  root GET  /                                                                                        restaurants#index
    #    restaurant_reviews POST /restaurants/:restaurant_id/reviews(.:format)                                            reviews#create
    # new_restaurant_review GET  /restaurants/:restaurant_id/reviews/new(.:format)                                        reviews#new
    #           restaurants GET  /restaurants(.:format)                                                                   restaurants#index
    #                       POST /restaurants(.:format)                                                                   restaurants#create
    #        new_restaurant GET  /restaurants/new(.:format)                                                               restaurants#new
