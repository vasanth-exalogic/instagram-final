Rails.application.routes.draw do
  root 'home#index'
  get '/:id' => 'home#profile', as: 'profile'
  devise_for :users, controllers: {
    sessions: 'users/sessions'
  }
  get '/posts/upload' => 'home#upload', as: 'new_post'
  post '/upload/post' => 'home#uploading', as: 'upload_post'
  get '/posts/:id' => 'home#posts', as: 'post'

  get '/follow/:id' => 'followers#create', as: 'follow'
  delete '/unfollow/:id' => 'followers#destroy', as: 'unfollow'

  get '/like/:id' => 'like#create', as: 'like'
  get '/unlike/:id' => 'like#destroy', as: 'unlike'

  get '/like1/:id' => 'like#create1', as: 'like1'
  get '/unlike1/:id' => 'like#destroy1', as: 'unlike1'

  post '/comment/:id' => 'comments#create', as: 'comment'

  get '/find/friends' => 'home#find', as:'find_friends'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
