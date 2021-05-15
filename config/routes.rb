# frozen_string_literal: true

Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  
  resources :questionnaires, param: :slug, only: %i[index show] do
    member do
      get ':uid/steps/:step_position', to: 'steps#show_questions'
      post ':uid/steps/:step_position', to: 'steps#save_answers'
      get 'completed'
    end
  end
  
  root 'questionnaires#index'
end
