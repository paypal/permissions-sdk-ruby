Dummy::Application.routes.draw do

  mount PermissionsSamples::Engine => "/samples", :as => :permissions_samples

end
