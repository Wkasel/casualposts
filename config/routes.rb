Rails.application.routes.draw do
  mount Ckeditor::Engine => '/ckeditor'
  resources :categories, only: [:index, :show]
  resources :posts
  resources :users, except: [:index]

  get '/session/login', to: 'session#login', as:'login'
  post '/session/login', to: 'session#create'
  get '/session/logout', to: 'session#logout', as:'logout'

  root 'welcome#index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
