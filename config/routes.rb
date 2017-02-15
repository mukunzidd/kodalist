Rails.application.routes.draw do
  devise_for :users
  resources :posts do
  	resources :replies
  end

  root 'posts#index'
end
