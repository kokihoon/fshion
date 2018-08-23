Rails.application.routes.draw do

  root "home#new"
  resources :notes

  post '/home/my_page' => 'home#my_page'
  post '/home/hotel' => 'home#hotel'
  get '/home/new' => 'home#new'
  post '/home/new' =>  'home#new'
  get '/home/hotel' => 'home#hotel'

  get '/home/attract' => 'home#attract'
  post '/home/attract' => 'home#attract'
  # get '/home/create' => 'home#create'

  get '/home/detailed_content/:pos' => 'home#detailed_content'

  post '/home/check' => 'home#check'
  get '/home/check' => 'home#check'


  post '/home/index' => 'home#index'
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
