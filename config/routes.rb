Rails.application.routes.draw do

  devise_for :admins, path: 'admin', controllers: {
    sessions: "admins/sessions"
  }
  
  namespace :admin do
    root to: 'homes#top'
  end
end
