Rails.application.routes.draw do

  get 'finder', to: 'githubfinder#index'

  get 'users/index'

  devise_for :users, controllers: { registrations: 'user_info' }
  resources :posts do
  	resources :replies
  end

  #Take care of this
  get '/profile', to: "profiles#profile"

  # Messaging routes
  get '/chat', to: "conversations#index"
  resources :users, only: [:index]
	resources :personal_messages, only: [:new, :create]
	resources :conversations, only: [:index, :show]

	# Chatroomsm stuff
	resources :chat_rooms, only: [:new, :create, :show, :index]

	# Action Cable
	mount ActionCable.server => '/cable'

  root 'posts#index'
end
