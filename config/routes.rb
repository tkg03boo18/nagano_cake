Rails.application.routes.draw do

  devise_for :customers, controllers: {
    sessions: "customers/sessions",
    registrations: "customers/registrations",
    passwords: "customers/passwords"
  }
  devise_for :admins, path: 'admin', controllers: {
    sessions: "admins/sessions"
  }

  namespace :admin do
    resources :items, only: [:new, :create, :index, :show, :edit, :update]
    resources :genres, only: [:index, :create, :edit, :update]
  end
  get 'admin' => 'admin/homes#top'

  scope module: :public do
    root to: 'homes#top'
    get 'about' => 'home#about'
  end


end
