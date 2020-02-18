Rails.application.routes.draw do

	devise_for :users
 
 post "/auth/facebook", to: 'social_auth#facebook_auth'
 resources :brands do
 	resources :products do
 		collection {post :import_from_file}
 	end
 end
 resources :brands do
	  collection {post :import_from_file}
   end
    get "/import", to: 'brands#import'
 	get "/search_brand", to: 'brands#search_brand'



    get "/import", to: 'products#import'
  	get "/search_product", to:'products#search_product'

end
