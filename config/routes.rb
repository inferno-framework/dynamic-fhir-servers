Rails.application.routes.draw do
  resources :allergy_intolerances
  # client will get to /getById and this will route it to the getById method in read controller
  get ":type/:id", to: "read#getById"
  get ":type", to: "search#search"
  resources :todos do
    resources :items
  end
end
