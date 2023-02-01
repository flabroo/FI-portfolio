Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "projects#home"
  get "about", to: "projects#about"
  get 'download_cv', to: "projects#download_cv"
  post 'bot_message', to: "projects#bot_message"

  resources :projects
end
