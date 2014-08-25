Rails.application.routes.draw do
  root "homepage#show"

  resources :flicks
end
