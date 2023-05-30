Rails.application.routes.draw do
  root 'projects#home'
  get 'about', to: 'projects#about'
  get 'fairul_izwan_cv', to: 'projects#fairul_izwan_cv'
  post 'bot_message', to: 'projects#bot_message'

  resources :projects
end
