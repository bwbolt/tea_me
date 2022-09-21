Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :teas, only: %i[create index]
      resources :customers, only: %i[create index]
      get '/customer', to: 'customers#show'
    end
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
