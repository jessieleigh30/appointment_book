Rails.application.routes.draw do
 
  root 'patients#index'

  resources :patients
  resources :doctors do
    resources :appointments, only: [:index, :new, :create, :destroy]
  end
end
