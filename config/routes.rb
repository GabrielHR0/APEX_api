Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
        devise_for :users,
          controllers: {
            sessions: 'api/v1/users/sessions',
            registrations: 'api/v1/users/registrations'
          },
          path: '',
          path_names: {
            sign_in: 'login',
            sign_out: 'logout',
            registration: 'signup'
          }
        
        resources :social_media_profiles
        resources :companies do
          resource :address, controller: 'company_address', only: [:show, :create, :update]
        end
        
        resources :users
        resources :extension_cores
        resources :projects
        resources :email_logs
        resources :contacts
    end
  end
end
