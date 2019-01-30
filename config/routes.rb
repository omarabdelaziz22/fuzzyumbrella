Rails.application.routes.draw do
  get 'home_page/home'
  resources   :products

  put '/favoritelists/add_to_favorite/:product_id' => 'favoritelists#favorite', as: :favorite_favoritelist
  get '/favoritelist' => 'favoritelists#show', as: :user_favoritelist
  resources   :categories
  devise_for  :users
  resources   :users, only: [:index, :show]
  root to: 'home_page#home'
end
