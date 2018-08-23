Rails.application.routes.draw do

  root "home#new"
  resources :notes

  get '/home/my_page' => 'home#my_page'
  get '/home/hotel' => 'home#hotel'

  get '/home/new' =>  'home#new'

  get '/home/attract' => 'home#attract'
  # get '/home/create' => 'home#create'

  get '/home/detailed_content/:pos' => 'home#detailed_content'

  get '/home/check' => 'home#check'

  get '/home/map' => 'home#map'

  post '/home/index' => 'home#index'
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
