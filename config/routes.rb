Rails.application.routes.draw do

  devise_for :users, 
             path: 'api/v1',
             path_names: {
               sign_in: 'login',
               sign_out: 'logout',
               registration: 'signup'
             },
             controllers: {
               sessions: 'api/v1/users/sessions',
               registrations: 'api/v1/users/registrations'
             },
             defaults: { format: :json }

  namespace :api do
    namespace :v1 do

      resources :hero_cards
      resources :events

      resources :page_views, only: [:create, :index] do
        collection do
          get :stats
          get :monthly
          get :by_page
        end
      end

      resources :cards do
        member do
          patch :move_up
          patch :move_down
          patch :move_to_position
        end

        collection do
          post :reorder
        end
      end

      resources :carousel_frames do
        member do
          patch :move_up
          patch :move_down
          patch :move_to_position
        end

        collection do
          post :reorder
        end
      end

      resources :social_media_profiles
      resources :companies do
        resource :address,
          controller: 'company_address',
          only: [:show, :create, :update]
      end

      resources :users do
        collection do
          get 'me'
        end
      end
      resources :extension_cores
      resources :projects
      resources :email_logs
      resources :contacts
    end
  end
end
