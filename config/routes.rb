Rails.application.routes.draw do
  get 'flashcard/select' => 'flashcard#select'


  get 'library' => 'library#select'
  get 'library/select' => 'library#select'
  get 'library/all' => 'library#all'
  get 'library/fav' => 'library#fav'
  get 'library/check' => 'library#check'
  get 'library/incorr' => 'library#incorr'
  get 'library/unlearn' => 'library#unlearn'
  get 'library/index/:id' => 'library#index'
  get 'library/:id' => 'library#show'
  get 'library/:id/edit' => 'library#edit'
  post 'library/:id/update' => 'library#update'
  get 'library/:id/newcom' => 'library#newcom'
  post 'library/:id/createcom' => 'library#createcom'
  post 'library/:q_id/:id/delcom' => 'library#delcom'
  post 'library/:id/newimg' => 'library#newimg'
  post 'library/:q_id/:id/delimg' => 'library#delimg'
  get 'library/:id/newref' => 'library#newref'
  get 'library/search' => 'library#search'
  post 'library/:o_id/:d_id/addref' => 'library#addref'

  post 'library/:o_id/:d_id/delref' => 'library#delref'

  get '/' => 'home#top'
  get 'about' => 'home#about'
  get 'mode' => 'home#mode'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
