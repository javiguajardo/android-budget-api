Rails.application.routes.draw do
  get 'budgets/index'

  resources :expenses
  resources :categories
  resources :accounts
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
