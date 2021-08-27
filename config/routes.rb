Rails.application.routes.draw do
  devise_for :users

  resources :posts do
    collection do
      post :like_post
    end
    resources :comments
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  
  root to: "dashboard#index"
end
