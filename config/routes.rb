Rails.application.routes.draw do
  resources :books, only: %i[index show]

  resources :users, only:[] do
   resources :rents, only: %i[index create]
  end

  get 'book_information/:isbn', action: :book_information, controller: 'open_library_books'

  mount_devise_token_auth_for 'User', at: 'auth'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
