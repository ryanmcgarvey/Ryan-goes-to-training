Events::Application.routes.draw do
  root :to => "events#index"
  match 'upcoming-events' => 'events#index'
  #START:metal
  match 'job_status/:id' => JobPoller.action(:index)
  #END:metal
  #START:rack
  match "hello-rack" => HelloRack
  #END:rack
  
  
  match "jobs/implicit" => "jobs#implicit"
  match "jobs/explicit" => "jobs#explicit"
  
  resources :events do
    resources :registrations, :reviews
    get :search, :on => :collection
    post :refresh_tweets, :on => :member
  end

  resource  :session
  resources :users

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id(.:format)))'
end
