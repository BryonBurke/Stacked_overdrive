Rails.application.routes.draw do
   root 'questions#index'
  resources :questions do
    resources :answers

  end
  get '/signup' => 'users#new'
  get '/edit' => 'users#edit'
  get '/users' => 'users#index'
  post '/users' => 'users#create'
  patch '/users' => 'users#update'
  delete '/users' => 'users#destroy'
  get '/signin' => 'sessions#new'
  post '/signin' => 'sessions#create'
  get '/signout' => 'sessions#destroy'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
