ActionController::Routing::Routes.draw do |map|
  map.root :controller => 'users', :action => 'index'
    
  map.redeem_user_invite '/sign_up/:invite_code', :controller => 'users', :action => 'new'
  map.resources :users
  map.resources :user_invites
end
