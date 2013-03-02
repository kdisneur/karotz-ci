KarotzCI::Application.routes.draw do
  devise_for :users

  authenticated :user do
    root to: 'karotz_rabbits#index'
    resources :karotz_rabbits
  end
  root to: 'home#show'

  resources :karotz_rabbits do
    resources :callbacks, only: [:create]
  end

  match '500.html', to: redirect('/500.html'), as: :error_path
end
