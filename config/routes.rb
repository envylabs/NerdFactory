NerdFactory::Application.routes.draw do |map|
  devise_for :users

  resources :categories,  :only => [:show, :new, :create] do
    resources :products,  :only => [:new, :create]
  end
  resources :products,    :only => [:index, :show]

  resource :cart,     :controller => 'cart',      :only => [:show, :create, :update, :destroy]
  resource :checkout, :controller => 'checkout',  :only => [:show, :create]
  resource :contact,  :controller => 'contact',   :only => [:show, :create]

  match '/store', :to => "products#index"
    
  match '/teas/(:id)', :to => redirect {|params| "/products/#{params[:id]}" }
  
  match '/:id', :to => "products#show", :constraints => {:id => /\d+/}
  
  root :to => "products#index"
end