Rails.application.routes.draw do

  root 'static_pages#home'
  get '/about', to: 'static_pages#about'

  get  '/signup',  to: 'users#new'
  post '/signup',  to: 'users#create'

  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'

  get    '/tag_search', to: 'tags#search'

  delete '/tags/:id', to: 'tags#destroy'

  resources :users
  resources :account_activations, only: [:edit]
  resources :password_resets,     only: [:new, :create, :edit, :update]

  resources :subject_posts,       only: [:create, :show, :index, :destroy]
  resources :reply_posts,         only: [:create, :show, :index, :destroy]
  resources :feedback_posts,      only: [:create, :show, :destroy, :edit, :index, :update]

  resources :tags,                only: [:destroy, :create] do
    get 'subject_posts', to: 'subject_posts#search'
  end

    delete 'tags/:id', to: 'tags#destroy'
    post 'tags/create', to: 'tags#create'

    #簡単ログイン用のroute
    post '/guest', to: 'guest_sessions#create'

  #開発環境でメールを確認する
  #http://localhost:3000/letter_openerにアクセス
  if Rails.env.development?
    mount LetterOpenerWeb::Engine, at: "/letter_opener"
  end
end
