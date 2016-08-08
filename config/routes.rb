Rails.application.routes.draw do
  get '/' => 'products#index'
  get '/products' => 'products#index'
  get '/products/new' => 'products#new'
  post '/products' => 'products#create'
  get 'products/:id' => 'products#show'
  get '/products/:id/edit'=> 'products#edit'
  patch '/products/:id'=> 'products#update'
  delete '/products/:id' => 'products#destroy'
  get '/search' => 'products#search'


  get '/images/new' => 'images#new'
  post '/images' => 'images#create'

  get '/signup' => 'users#new'
  post '/users' => 'users#create'


  get'/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  delete'/logout' => 'sessions#destroy'

  post '/shoppingcart' => 'carted_products#create'
  get '/shoppingcart' =>'carted_products#index'



  post '/orders' => 'orders#create'
  get '/orders/:id' => 'orders#show'


  delete '/shoppingcart/:id' => 'carted_products#destroy'
end
