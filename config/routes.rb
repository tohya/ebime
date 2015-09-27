Ebime::Application.routes.draw do
  root 'sessions#new'
  resources :sessions,      only: [:new, :create, :destroy]
  match '/signin',  to: 'sessions#new',         via: 'get',    as: 'signin'
  match '/kintai',  to: 'kintais#index',        via: 'get',    as: 'kintai'
  match '/project', to: 'projects#index',       via: 'get',    as: 'project'
  match '/project', to: 'projects#update',      via: 'patch'
  match '/project', to: 'projects#destroy',     via: 'delete'
  resources :projects,      only: [:create]
  match '/assign',  to: 'user_projects#index',  via: 'get',    as: 'assign'
  resources :user_projects,      only: [:create, :update]  
  match '/jisseki', to: 'jissekis#index',       via: 'get',    as: 'jisseki'
  match '/jisseki', to: 'jissekis#index',       via: 'post'
  # match '/approval', to: 's#index',         via: 'get'
  match '/signout', to: 'sessions#destroy',     via: 'delete', as: 'signout'
  #resources :users
end
