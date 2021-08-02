Rails.application.routes.draw do
  devise_for :users
  root to: "homes#top"

  get "/home/about" => "homes#about"
  resources :books do
   resource :favorites, only:[:create, :destroy]
   resources :book_comment, only: [:create, :destroy]
  end

  resources :users, only: [:show,:index,:edit,:update]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end