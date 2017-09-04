Rails.application.routes.draw do

  devise_for :users
  resources :subjects do
    resources :attendances, only: [:index, :show, :create]
  end

  root controller: 'welcome', action: :index
  post '/SubjectCreate', to: 'subject#create'
end
