Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'welcome#index'
  resources :users
  resources :sessions
  delete "/logout" =>  "sessions#destroy", as: :logout
  get 'about', to: 'welcome#about'
  get 'download', to: 'welcome#download_resume'

  resources :articles do
    get :search, on: :collection
    post :preview, on: :collection
    resources :comments
  end

  resources :resumes, only: [:edit, :update]

  # 用户相关信息路由跟在用户名之后
  #constraints(id: User::USERNAME_FORMAT) do
    #resources :users, path: '', as: 'users' do
      #member do
        #get :articles
        #get :comments
      #end
    #end

  #end

  # 设置
  resource :setting do
    member do
      get :profile
      get :reward
      get :password
    end
  end

  # 后台管理
  namespace :admin do
    root 'sessions#new'
    resources :sessions
  end
end
