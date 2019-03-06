Rails.application.routes.draw do
  namespace :api do 
    post '/users' => 'users#create'

    post '/sessions' => 'sessions#create'
    
    # get '/locations' => 'locations#index'
    # post '/locations' => 'locations#create'
    # get '/locations/:id' => 'locations#show'
    # patch '/locations/:id' => 'locations#update'
    # delete '/locations/:id' => 'locations#destroy'
  end
end
