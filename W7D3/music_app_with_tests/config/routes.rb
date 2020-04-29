Rails.application.routes.draw do

  resources :users, only: [:create, :show, :new]
  resource :session, only: [:create, :new, :destroy]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :bands, only: [:create, :show, :new, :index, :edit, :destroy, :update] do
    resources :albums, only: [:new]
  end

  resources :albums, only: [:create, :edit, :show, :update, :destroy]
end
