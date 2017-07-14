Rails.application.routes.draw do

  devise_for :users
  #resources :produtos, only: [:new, :create, :destroy, :edit, :update]
  resources :produtos

  get "/produtos/busca" => "produtos#busca", as: :busca_produto

  get "welcome/index" => "welcome#index"

  root "welcome#index"
end
