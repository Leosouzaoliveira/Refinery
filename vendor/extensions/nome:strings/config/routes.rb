Refinery::Core::Engine.routes.append do

  # Frontend routes
  namespace :nome:strings do
    resources :nome:strings, :path => '', :only => [:index, :show]
  end

  # Admin routes
  namespace :nome:strings, :path => '' do
    namespace :admin, :path => 'refinery' do
      resources :nome:strings, :except => :show do
        collection do
          post :update_positions
        end
      end
    end
  end

end
