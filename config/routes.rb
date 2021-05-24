Rails.application.routes.draw do

  devise_for :admins, path: 'admin', controllers: {
    sessions: "admins/sessions"
  }
  
  namespace :admin do
    root to: 'homes#top'
    resources :items, only: [:new, :create, :index, :show, :edit, :update]
    resources :genres, only: [:index, :create, :edit, :update]
  end
end
