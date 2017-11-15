Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
#  resources :archives
#  resources :couples
#  resources :special_classes
#  resources :courses
#  resources :students
#  resources :lessons
#  resources :weddings

scope(path_names: { new: 'nuevo', edit: 'editar' }) do
  resources :archives, path: 'interesados' do
    get 'search', on: :collection
  end
end

  scope(path_names: { new: 'nueva', edit: 'editar' }) do
    resources :couples, path: 'parejas' do
      get 'search', on: :collection
    end
  end

  scope(path_names: { new: 'nueva', edit: 'editar' }) do
    resources :special_classes, path: 'clasesparticulares' do
      get 'search', on: :collection
    end
  end

  scope(path_names: { new: 'nuevo', edit: 'editar' }) do
    resources :courses, path: 'cursos' do
      get 'search', on: :collection
    end
  end

  scope(path_names: { new: 'nueva', edit: 'editar' }) do
    resources :students, path: 'alumnas' do
      get 'search', on: :collection
    end
  end

  scope(path_names: { new: 'nueva', edit: 'editar' }) do
    resources :lessons, path: 'clases' do
      get 'search', on: :collection
    end
  end

  scope(path_names: { new: 'nuevo', edit: 'editar' }) do
    resources :weddings, path: 'matrimonios' do
      get 'search', on: :collection
      get 'todos', on: :collection
    end
  end

  devise_for :users, controllers: { registrations: "registrations"}

  resources :users, only: [:index, :show]
  get 'hola/index'
  get 'hola/portada'
  get 'agenda' => 'lessons#agenda'
  get 'bloquearhorario' => 'lessons#bloquear'

  authenticated :user do
    root to: 'hola#portada', as: :authenticated_root
  end
  root to: redirect('/users/sign_in')

  # root 'hola#portada'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
