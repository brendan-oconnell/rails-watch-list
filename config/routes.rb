Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :lists, only: [:create, :index, :new, :show] do
    resources :bookmarks, only: [:create, :new]
  end
  resources :bookmarks, only: :destroy
  resources :movies, only: [:create, :new]
end
