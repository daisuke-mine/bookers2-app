Rails.application.routes.draw do
  get 'searches/search'
  devise_for :users
  root to: "homes#top"

  get "/home/about" => "homes#about"
  get '/search' => 'searchs#search'
  resources :books do
   resource :favorites, only:[:create, :destroy]
   resources :book_comment, only: [:create, :destroy]
  end

  resources :users, only: [:show,:index,:edit,:update] do
    resource :relationships, only: [:create, :destroy]
    get 'followings' => 'relationships#followings', as: 'followings'
    get 'followers' => 'relationships#followers', as: 'followers'
  end
  
end