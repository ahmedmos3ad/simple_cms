Rails.application.routes.draw do

  # resources :subjects do
  # end
  scope "(:locale)", locale: /en|ar/ do
    resources :subjects
  end

  resources :users

  get '/:locale' => 'demo#index'
  root 'demo#index'
  get 'demo/index'
  get 'demo/other_index'
  
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
