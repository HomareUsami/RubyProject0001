Rails.application.routes.draw do
  get "greeting_user_sessions/new"
  get "greeting_user_sessions/create"
  get "greeting_user_sessions/destroy"
  get "greeting_users/new"
  get "greeting_users/edit"
  get "greeting_users/update"


  # カスタムルート
  # /loginでログイン画面を表示することが可能に
  # as: :loginでlogin_pathを自動生成されるようにして定義
  get "login", to: "greeting_user_sessions#new", as: :login
  post "login", to: "greeting_user_sessions#create" # ログイン処理を行う
  delete "logout", to: "greeting_user_sessions#destroy", as: :logout


  # onlyをつけない場合、不要なルートが出来てしまいセキュリティ的にも問題となりえる。
  resources :greetings
  resources :greeting_users, only: [ :new, :create, :edit, :update, :destroy ]
  resources :greeting_user_sessions, only: [ :new, :create, :destroy ]

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Render dynamic PWA files from app/views/pwa/* (remember to link manifest in application.html.erb)
  # get "manifest" => "rails/pwa#manifest", as: :pwa_manifest
  # get "service-worker" => "rails/pwa#service_worker", as: :pwa_service_worker

  # Defines the root path route ("/")
  # root "posts#index"
end
