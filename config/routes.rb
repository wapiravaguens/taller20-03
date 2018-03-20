Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get 'welcome/index', to: "welcome#index"
  root 'welcome#index'
  
  resources :todos do
    resources :items
  end

  #root 'pages#home'
end
