Rails.application.routes.draw do
  resources :users, except: :index do
    resources :topics, only: [:new, :create]
    resources :pairings, except: :show do
      resources :feedbacks, only: [:new, :create]
    end
    resources :feedbacks, only: [:index]
  end

  post '/sessions' => 'sessions#new'
  delete '/sessions' => 'sessions#destroy', as: 'logout'
  root 'users#show'



end
