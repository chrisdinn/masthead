ActionController::Routing::Routes.draw do |map|
  map.root :controller => 'users', :action => 'index'
    
  map.redeem_user_invite '/sign_up/:invite_code', :controller => 'users', :action => 'new'
  map.resources :users do |user|
    user.resource :password
    user.resource :confirmation
  end
  map.resources :passwords, :collection => { :success => :get }
  map.resources :user_invites
end
