Rails.application.routes.draw do

  root 'static_pages#home'
  get '/about', to: 'static_pages#about'

  get  '/signup',  to: 'users#new'
  post '/signup',  to: 'users#create'

  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'

  resources :users
  resources :account_activations, only: [:edit]
  resources :password_resets,     only: [:new, :create, :edit, :update]
  resources :subject_posts,       only: [:create, :destroy]


  #メールを確認する
  #http://localhost:3000/letter_openerにアクセス
  if Rails.env.development?
    mount LetterOpenerWeb::Engine, at: "/letter_opener"
  end
end
