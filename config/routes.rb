Rails.application.routes.draw do
  if @current_user.present?
    root :to => 'session#new'
  else
    root :to => 'feeds#index'
  end


  resources :users
  resources :feeds
  resources :songs

  get '/login' => 'session#new' 
  post '/login' => 'session#create'
  delete '/login' => 'session#destroy'

end
