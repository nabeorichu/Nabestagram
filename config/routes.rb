Rails.application.routes.draw do

  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  devise_for :users, controllers: {
    ragistrations: "users/registrations",
    omniauth_callbacks: "users/omniauth_callbacks"
  }
  resources :pictures, only: [:index, :new, :create, :edit, :update, :destroy] do
    # collection do
  #  post :confirm
  
 end
 if Rails.env.development?
   mount LetterOpenerWeb::Engine, at: "/letter_opener"
 end
 root 'top#index'
end
