HumanResources::Application.routes.draw do
  resources :people 
    
  resources :teams do
    member do
      get :change_people
      put 'change/:person_id', to: :add_person, as: :add_person
      delete 'change/:person_id', to: :remove_person, as: :remove_person
    end
  end
  
end
