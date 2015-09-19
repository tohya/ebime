Ebime::Application.routes.draw do
  root 'sessions#new'
  resources :sessions,      only: [:new, :create, :destroy]
  match '/signin',  to: 'sessions#new',         via: 'get',    as: 'signin'
  match '/kintai',  to: 'kintais#index',        via: 'get',    as: 'kintai'
  match '/project', to: 'projects#index',       via: 'get',    as: 'project'
  match '/assign',  to: 'user_projects#index',  via: 'get',    as: 'assign'
  match '/jisseki', to: 'jissekis#index',       via: 'get',    as: 'jisseki'
  # match '/approval', to: 's#index',         via: 'get'
  match '/signout', to: 'sessions#destroy',     via: 'delete', as: 'signout'
end
