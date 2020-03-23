Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root to: 'articles#top'
  post   '/like/:article_id' => 'likes#like',   as: 'like'
  delete '/like/:article_id' => 'likes#unlike', as: 'unlike'
  get "users/:id/likes" => "users#likes", as: 'likes'
  resources :users
  resources :articles  do
  	resource :comments, only: [:create]
  	collection do
      get 'search' => 'articles#search'
    end
  end
end
