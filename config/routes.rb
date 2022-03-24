Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  namespace :api, defaults: { format: :json } do
    resources :recruiters do
      collection do
        post :login
        get :auto_login
        resources :submissions
        resources :jobs
      end
    end
    resources :submissions
    resources :jobs
  end


end
