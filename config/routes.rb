Rails.application.routes.draw do
  resources :users, except: :index do
    get 'student'
    get 'mentor'
    resources :topics, only: [:new, :create]
    resources :feedbacks, only: [:index]
  end

  resources :pairings, except: :show do
    resources :feedbacks, only: [:new, :create]
  end

  post '/sessions' => 'sessions#new'
  delete '/sessions' => 'sessions#destroy', as: 'logout'
  root 'users#show'
end
