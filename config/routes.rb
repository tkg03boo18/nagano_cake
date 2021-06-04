Rails.application.routes.draw do

  devise_for :customers, path: 'customer', controllers: {
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
    resources :customers, only: [:index, :show, :edit, :update]
    resources :orders, only: [:show, :update]
    patch 'admin/orders/:order_id/order_details/:id' => 'admin/order_details#update', as: 'order_detail'
  end
  get 'admin' => 'admin/homes#top'

  scope module: :public do
    root to: 'homes#top'
    get 'about' => 'homes#about'

    get 'customers/mypage' => 'customers#show'
    get 'customers/edit' => 'customers#edit'
    patch 'customers' => 'customers#update'
    put 'customers' => 'customers#update'
    get 'customers/unsubscribe' => 'customers#unsubscribe'
    patch 'customers/withdraw' => 'customers#withdraw'

    resources :addresses, only: [:index, :edit, :create, :update, :destroy]

    delete 'cart_items/destroy_all' => 'cart_items#destroy_all'
    resources :cart_items, only: [:index, :update, :destroy, :create]


    resources :items, only: [:index, :show]

    get 'orders/thanks' => 'orders#thanks'
    resources :orders, only: [:new, :create, :index, :show]
    post 'orders/confirm' => 'orders#confirm'

  end


end
