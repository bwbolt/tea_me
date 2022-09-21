Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :teas, only: %i[create index]
      resources :customers, only: %i[create index]
      get '/customer', to: 'customers#show'
      resources :subscriptions, only: %i[create]
      delete '/subscription', to: 'subscriptions#destroy'
    end
  end
end
