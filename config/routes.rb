Rails.application.routes.draw do
  resources :users, except: :index do
    resources :topics, only: [:new, :create]
    resources :feedbacks, only: [:new, :create, :index]
  end
  resources :pairings, except: :show

  post '/sessions/new' => 'sessions#new'

  root "users#new"
end
