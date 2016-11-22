Rails.application.routes.draw do
#  resources :weddings
  scope(path_names: { new: 'nuevo', edit: 'editar' }) do
    resources :weddings, path: 'matrimonios'
  end

  devise_for :users
  get 'hola/index'

  root 'hola#index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
