Rails.application.routes.draw do
  root to: 'power_generators#index'
  resources :power_generators, path: 'home', only: %i[index show shipping] do
    post :shipping,  on: :collection
  end
end
