Rails.application.routes.draw do

  root :to => 'homes#top'

  get 'books' => 'books#index', as: 'index' 
  post 'books' => 'books#create', as: 'index_c'
  
  get 'books/show'
  get 'books/edit'
  # get 'homes/top' 
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
