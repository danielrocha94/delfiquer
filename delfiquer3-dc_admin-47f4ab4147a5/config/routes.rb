Rails.application.routes.draw do
  devise_for :users
  devise_for :admin_users, ActiveAdmin::Devise.config

  devise_scope :user do
    authenticated :user do
      root 'dashboard#index', as: :authenticated_user_root
    end
  end
  ActiveAdmin.routes(self)

  get '/dashboard', to: 'dashboard#index', as: :dashboard
  get '/patient/:id', to: 'dashboard#show', as: :patient

  root to: 'devise/sessions#create'
end
