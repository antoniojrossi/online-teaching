Rails.application.routes.draw do
  resources :proposed_courses, only: [:index, :create]
  resources :courses, only: [:index, :show, :create]
end
