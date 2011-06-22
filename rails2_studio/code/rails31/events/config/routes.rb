Events::Application.routes.draw do
  root :to => "events#index"
  match 'upcoming-events' => 'events#index'
  
  resources :events do
    resources :registrations, :reviews
    get :search, :on => :collection
  end

  resource  :session
  resources :users

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  #  match ':controller(/:action(/:id(.:format)))'
end