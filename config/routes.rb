Rails.application.routes.draw do
  # Pages
  root 'pages#home'
  get 'about', to: 'pages#about', as: :about

  # Files/API calls
  get 'fairul_izwan_cv', to: 'files#fairul_izwan_cv', as: :cv
  post 'bot_message', to: 'projects#bot_message', as: :bot_message

  # Errors
  match '/404', to: 'errors#not_found', via: :all
  match '/500', to: 'errors#internal_server_error', via: :all

  resources :projects, only: %i[show]
end
