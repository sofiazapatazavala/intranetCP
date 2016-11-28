Rails.application.routes.draw do
#  resources :lessons
#  resources :weddings
  scope(path_names: { new: 'nueva', edit: 'editar' }) do
    resources :lessons, path: 'clases'
  end

  scope(path_names: { new: 'nuevo', edit: 'editar' }) do
    resources :weddings, path: 'matrimonios'
  end

  devise_for :users, controllers: { registrations: "registrations"}

  get 'hola/index'
  get 'hola/portada'

  root 'hola#portada'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
