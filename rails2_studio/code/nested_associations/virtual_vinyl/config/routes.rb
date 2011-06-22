ActionController::Routing::Routes.draw do |map|

  map.resources :artists
  
  map.resources :jsartists   # just to demo JS forms
end
