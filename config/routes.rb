Rails.application.routes.draw do
  resources :formal
  devise_for :users, controllers: { registrations: 'registrations' }
  authenticated :user do
    root 'formal#index', as: :authenticated_root
  end

  get 'admin/user', to: 'admin#user'
  get 'admin/form', to: 'admin#form'
  get 'admin/export', to:'admin#export'
  post 'admin/export', to:'admin#create'

  match 'download', to: 'admin#download', as: 'download', via: :get

  root "home#index"
end