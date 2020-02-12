Rails.application.routes.draw do
 
 resources :brands do
	  collection {post :import_from_file}
   end
    get "/import", to: 'brands#import'
 	get "/search_brand", to: 'brands#search_brand'

 

  resources :products do
	  collection {post :import_from_file}
   end
    get "/import", to: 'products#import'
  	get "/search_product", to:'products#search_product'

end
