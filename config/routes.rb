Rails.application.routes.draw do
  get "/register", to: 'users#new'
  get '/dashboard', to: 'users#show'
  post '/users', to: 'users#create'

  get '/login', to: 'users#login_form'
  post '/login', to: 'users#login_user'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root 'welcome#index'

  get 'users/discover', to: 'users#discover'
  get 'users/movies/:id', to: 'movies#movie_details'
  get 'users/movies/:id/viewing-party/new', to: 'viewing_parties#new'
  post 'users/movies/:id/viewing-party/new', to: 'viewing_parties#create'

  get '/movies/top_movies', to: 'movies#top_movies'
  get '/movies/search_results', to: 'movies#search_results'
end
