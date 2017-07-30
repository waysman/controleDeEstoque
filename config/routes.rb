Rails.application.routes.draw do

  get "/produtos/busca" => "produtos#busca", as: :busca_produto
  devise_for :users
  #resources :produtos, only: [:new, :create, :destroy, :edit, :update]
  resources :produtos



  get "welcome/index" => "welcome#index"

  root "welcome#index"
end
