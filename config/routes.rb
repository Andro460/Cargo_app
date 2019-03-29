Rails.application.routes.draw do
  
mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
devise_for :users
root to: 'posts#index'

get 'about' => 'home#about'
get 'my_posts' => 'posts#my_posts'

resources :posts do
  resources :comments, only: [:create, :destroy]
  member do
    put "like" => "posts#upvote"
    put "dislike" => "posts#downvote"
  end
end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
