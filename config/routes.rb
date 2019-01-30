Rails.application.routes.draw do
  get 'home_page/home'
  resources   :products
  resources   :favoritelists do
    put :favorite, on: :member
    end
  resources   :categories
  devise_for  :users
  resources   :users, only: [:index, :show]
  root to: 'home_page#home'
end
