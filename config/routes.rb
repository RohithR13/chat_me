Rails.application.routes.draw do
  get 'signup', to: 'users#new'
  post 'signup', to: 'users#create'
  patch  'signup', to: 'users#update'
  get 'edit', to: 'users#edit'
   
  delete 'user', to: 'users#destroy'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'chatroom#index'
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'
  post 'message', to: 'messages#create'


  mount ActionCable.server, at: '/cable'
end
