Rails.application.routes.draw do
  concern :votable do
    resources :votes, only: [:create]
  end

  resources :courses, only: [:index, :show, :create], concerns: :votable
  resources :teachers, only: [:index], concerns: :votable

  resources :proposed_courses, only: [:index, :create]
end
