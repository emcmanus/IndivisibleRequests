Rails.application.routes.draw do
  resources :posts do
    post 'follow',    to: 'posts#follow'
    delete 'follow',  to: 'posts#unfollow'
  end
  devise_for :users
  root 'posts#index'
end
