Rails.application.routes.draw do
  get 'flashcard/select' => 'flashcard#select'



  get 'library/select' => 'library#select'
  get 'library/fav' => 'library#fav'
  get 'library/check' => 'library#check'
  get 'library/incorr' => 'library#incorr'
  get 'library/unlearn' => 'library#unlearn'
  get 'library/all' => 'library#all'
  get 'library/index/:id' => 'library#index'
  get 'library/:id' => 'library#show'
  get 'library/:id/edit' => 'library#edit'
  post 'library/:id/update' => 'library#update'

  get '/' => 'home#top'
  get 'about' => 'home#about'
  get 'mode' => 'home#mode'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
