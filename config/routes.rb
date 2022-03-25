Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  namespace :api, defaults: { format: :json } do
    scope module: :login do
      post :login
      get :auto_login
    end

    namespace :recruiters do
      resources :submissions
      resources :jobs
    end
    resources :recruiters do
      # collection do
        # post :login
        # get :auto_login
        # resources :jobs
        # resources :submissions
      # end
    end

    # scope :recruiters do
    #   resources :submissions
    #   resources :jobs
    # end
    # namespace :recruiters do
    #   resources :submissions
    #   resources :jobs, controller: 'api/recruiters/jobs'
    # end
  end
  #
  # namespace :recruiters, defaults: { format: :json }do
  #   resources :submissions
  #   resources :jobs, controller: 'recruiters/jobs'
  # end
end
