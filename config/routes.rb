HumanResources::Application.routes.draw do
  devise_for :admins
  devise_for :users

  root 'pages#index', as: :home

  get "pages/about"
  get "pages/contact"

  # Make both people and teams nested resources for users
  resources :users, only: [:index, :show] do

    resources :people do
      member do
        get :change_teams

        post 'change/:team_id', to: :add_to_team, as: :add_to_team
        delete 'change/:team_id', to: :remove_from_team, as: :remove_from_team
      end
    end

    resources :teams do
      member do
        get :change_people
        post 'change/:person_id', to: :add_person, as: :add_person
        delete 'change/:person_id', to: :remove_person, as: :remove_person
      end
    end
  end
end
