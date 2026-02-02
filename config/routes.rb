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

      resources :hero_cards do
        member do
          patch :move_up
          patch :move_down
          patch :move_to_position
        end

        collection do
          post :reorder
        end
      end

      resources :hero_banners do
        collection do
          get :active
        end
      end
      
      resources :members


      resources :extension_cores do
        member do
          post :add_images
          delete :remove_image
          delete :remove_icon
        end
      end

      resources :events do
        member do
          patch :move_up
          patch :move_down
          patch :move_to_position
        end

        collection do
          post :reorder
        end
      end

      resources :page_views, only: [:create] do
            collection do
              get :summary      # Card de 
              get :chart_data   # O Gráfico (Dia/Mês)
              get :top_pages    # Lista de páginas
              get :top_sources  # Lista de navegadores (cru)
            end
          end

      resources :contacts do
        collection do
          get :summary      # Totais e contagem por status
          get :chart_data   # Gráfico de linha (Leads por dia/mês)
          get :by_status    # Dados para gráfico de Pizza (Status)
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
          post 'refresh'
        end
      end
      resources :extension_cores

      resources :projects do
        collection do
          get :count
        end
      end
      
      resources :email_logs
    end
  end
end
