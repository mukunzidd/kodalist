Rails.application.routes.draw do
  get 'users/index'

  devise_for :users, controllers: { registrations: 'user_info' }
  resources :posts do
  	resources :replies
  end

  get '/profile', to: "profiles#profile"

  # Messaging routes
  get '/chat', to: "conversations#index"
  resources :users, only: [:index]
	resources :personal_messages, only: [:new, :create]
	resources :conversations, only: [:index, :show]

	# Chatroomsm stuff
	resources :chat_rooms, only: [:new, :create, :show, :index]

  root 'posts#index'
end
