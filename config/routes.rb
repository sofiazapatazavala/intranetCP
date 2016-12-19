Rails.application.routes.draw do
#  resources :couples
#  resources :special_classes
#  resources :courses
#  resources :students
#  resources :lessons
#  resources :weddings
  scope(path_names: { new: 'nueva', edit: 'editar' }) do
    resources :couples, path: 'parejas'
  end

  scope(path_names: { new: 'nueva', edit: 'editar' }) do
    resources :special_classes, path: 'clasesparticulares'
  end

  scope(path_names: { new: 'nuevo', edit: 'editar' }) do
    resources :courses, path: 'cursos'
  end

  scope(path_names: { new: 'nueva', edit: 'editar' }) do
    resources :students, path: 'alumnas'
  end

  scope(path_names: { new: 'nueva', edit: 'editar' }) do
    resources :lessons, path: 'clases'
  end

  scope(path_names: { new: 'nuevo', edit: 'editar' }) do
    resources :weddings, path: 'matrimonios'
  end

  devise_for :users, controllers: { registrations: "registrations"}

  get 'hola/index'
  get 'hola/portada'
  get 'agenda' => 'lessons#agenda'

  authenticated :user do
    root to: 'hola#portada', as: :authenticated_root
  end
  root to: redirect('/users/sign_in')

  # root 'hola#portada'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
