Rails.application.routes.draw do
  resources :memos
  resources :styles
  resources :shoppers
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
