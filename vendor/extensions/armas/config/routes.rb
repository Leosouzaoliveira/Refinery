Refinery::Core::Engine.routes.append do

  # Frontend routes
  namespace :armas do
    resources :armas, :path => '', :only => [:index, :show]
  end

  # Admin routes
  namespace :armas, :path => '' do
    namespace :admin, :path => 'refinery' do
      resources :armas, :except => :show do
        collection do
          post :update_positions
        end
      end
    end
  end

end
