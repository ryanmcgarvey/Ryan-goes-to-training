Pdfsite::Application.routes.draw do

  resources :events

  match ':controller(/:action(/:id(.:format)))'
end
