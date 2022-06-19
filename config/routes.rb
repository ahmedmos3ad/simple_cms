Rails.application.routes.draw do
  
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)

  # scope "(:locale)", locale: /en|ar/ do
  #  resources :subjects
  # end

  get 'users/index', to:'users#index'
  resource :users, except:[:new,:edit]
  resources :users, only:[:show]
  post 'login', to: 'users#login'
  
  get '/:locale' => 'demo#index'
  root 'demo#index'
  
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
