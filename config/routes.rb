# frozen_string_literal: true

Rails.application.routes.draw do
  resources :allergy_intolerances
  # client will get to /getById and this will route it to the getById method in read controller
  get ':type/:id', to: 'read#getById'
  get ':type', to: 'search#search'
  post ':type', to: 'create#create'
  put ':type/:id', to: 'update#update'
  delete ':type/:id', to: 'delete#delete'
  resources :todos do
    resources :items
  end
end
