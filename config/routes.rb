Rails.application.routes.draw do
  namespace :api do 
    post '/users' => 'users#create'

    post '/sessions' => 'sessions#create'

    get '/user_locations' => 'user_locations#index'
    post '/user_locations' => 'user_locations#create'
    delete '/user_locations/:id' => 'user_locations#destroy'

    
    get '/drones' => 'drones#index'
    post '/drones' => 'drones#create'
    get '/drones/:id' => 'drones#show'
    patch '/drones/:id' => 'drones#update'
    delete '/drones/:id' => 'drones#destroy'

    get '/weathers' => 'weathers#index'
    post '/weathers' => 'weathers#create'
    get '/weathers/:id' => 'weathers#show'
    patch '/weathers/:id' => 'weathers#update'
    delete '/weathers/:id' => 'weathers#destroy'

    get '/locations' => 'locations#index'
    post '/locations' => 'locations#create'
    get '/locations/:id' => 'locations#show'
    patch '/locations/:id' => 'locations#update'
    delete '/locations/:id' => 'locations#destroy'

    get '/location_reviews' => 'location_reviews#index'
    post '/location_reviews' => 'location_reviews#create'
    get '/location_reviews/:id' => 'location_reviews#show'
    patch '/location_reviews/:id' => 'location_reviews#update'
    delete '/location_reviews/:id' => 'location_reviews#destroy'
  end
end
