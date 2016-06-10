Rails.application.routes.draw do

  devise_for :users
  root 'home#index'

  namespace :api, default: { respond_to: :json } do
    namespace :v0 do
      resources :hotels, only: [ :show, :index ]
      resources :bookings, only: [ :create, :index ] do
        collection do
          get ':user_id', action: 'user'
        end
      end
    end
  end

end
