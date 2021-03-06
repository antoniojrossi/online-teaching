Rails.application.routes.draw do
  concern :votable do
    resources :votes, only: [:create]
  end

  scope module: :v1, constraints: ApiVersion.new('v1', true) do
    resources :courses, concerns: :votable
    resources :teachers, concerns: :votable
    resources :proposed_courses, only: [:index, :create]
  end
end
