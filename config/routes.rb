Rails.application.routes.draw do
  get 'home/second'
  get 'home/third'
  get 'home/first'
  root 'home#first'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
