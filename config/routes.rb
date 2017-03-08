Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: 'user_info' }
  resources :posts do
  	resources :replies
  end

  get 'profiles/profile'

  root 'posts#index'
end
