Polymorphic::Application.routes.draw do
  resources :comments
  resources :articles do
    resources :comments
  end
  resources :events do
    resources :comments
  end
  resources :photos do
    resources :comments
  end
end
