Rails.application.routes.draw do
  
  devise_for :users
  resources :subjects do
    resources :attendances, only: [:index, :show, :create]
  end

  authenticated :user do
    root 'subjects#index', as: :authenticated_root
  end

  root controller: 'welcome', action: :index  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
