PermissionsSamples::Engine.routes.draw do
  match "permissions(/:action)",  :controller => "permissions", :as => :permissions
  root :to => "permissions#index"
end
