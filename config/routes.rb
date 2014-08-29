HumanResources::Application.routes.draw do
  resources :people 
    
  resources :teams do
    member do
      get :add_people
      put 'add/:person_id', to: :add_person, as: :add_person
      delete 'add/:person_id', to: :remove_person, as: :remove_person
    end
  end
  
end
