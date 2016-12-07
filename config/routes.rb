Rails.application.routes.draw do

  resources :produtos, only: [:new, :create, :destroy, :edit, :update]
  #resources :produtos
  root "produtos#index"
  get "/produtos/busca" => "produtos#busca", as: :busca_produto

end
