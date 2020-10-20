Rails.application.routes.draw do
  # client will get to /getById and this will route it to the getById method in read controller
  get 'read/getById', to: 'read#getById'
  get ":type/:id", to: "read#getType"
  resources :todos do
    resources :items
  end
end
