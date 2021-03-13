Rails.application.routes.draw do
  get '/second' => 'home#second'
  get '/third' => 'home#third'
  get 'home/first' 
  get '/new' => 'home#new'
  get '/hit' => 'home#hit'
  get '/stay' => 'home#start_dealer'
  get '/reset' => 'home#reset'
  post 'home/new' => 'home#create'
  root 'home#first'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
