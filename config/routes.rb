# frozen_string_literal: true

Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  
  get '/:slug(/:uid/step/:step_id)', to: 'questionnaires#show', as: 'questionnaire_show'
  get '/:slug/:uid/completed', to: 'questionnaires#completed', as: 'questionnaire_completed'
  
  root 'questionnaires#index'
end
