Rails.application.routes.draw do
  resources :posts do
    collection do
      post :search
    end
    resources :comments
  end
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root 'posts#index'
end
