Rails.application.routes.draw do
  resources :extension_cores
  resources :projects
  resources :email_logs
  resources :contacts
  namespace :api do
    namespace :v1 do
    end
  end
end
