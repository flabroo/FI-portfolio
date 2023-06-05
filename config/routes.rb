Rails.application.routes.draw do
  root 'pages#home'
  get 'about', to: 'pages#about', as: :about
  get 'fairul_izwan_cv', to: 'files#fairul_izwan_cv', as: :cv
  post 'bot_message', to: 'projects#bot_message', as: :bot_message

  resources :projects, only: %i[show]
end
