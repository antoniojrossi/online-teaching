Rails.application.routes.draw do
  concern :votable do
    resources :votes, only: [:create]
  end

  resources :courses, concerns: :votable
  resources :teachers, concerns: :votable

  resources :proposed_courses, only: [:index, :create]
end
