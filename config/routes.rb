Rails.application.routes.draw do
  resources :proposed_courses, only: :index
end
