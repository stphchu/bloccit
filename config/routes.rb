Rails.application.routes.draw do
 
 # #1
   resources :posts
   resources :advertisements
 # #2 
  get 'about' => 'welcome#about'

  root 'welcome#index'
end
