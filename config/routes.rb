Rails.application.routes.draw do
  resources :books, only: %i[index show]
  resources :rents, only: %i[create index]

  resources :users, only:[] do
   resources :rents, only: %i[index create]
  end

  mount_devise_token_auth_for 'User', at: 'auth'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
