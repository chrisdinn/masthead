ActionController::Routing::Routes.draw do |map|
  map.resources :user_invites

  
  map.root :controller => 'clearance/users', :action => 'index'
  
end
