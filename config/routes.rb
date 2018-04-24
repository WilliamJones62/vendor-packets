Rails.application.routes.draw do
  resources :packets do
    collection { post :import }
    resources :products do
      collection { post :import }
    end
  end
  devise_for :users, controllers: { registrations: "users/registrations" }
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'home#show'
  get 'home/inactive' => 'home#inactive'
  get 'home/ftpguides' => 'home#ftpguides'
  get 'home/websiteguides' => 'home#websiteguides'
end
