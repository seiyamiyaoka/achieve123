Rails.application.routes.draw do

  resources :tasks
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  resources :answers
  resources :questions do
    resources :answers
  end
  resources :comments
  get 'social_profile/create'=> 'social_profile#create'

  namespace :taskline do
    resources :tasks do
      resources :task_comment
      get "ungoodjob"
      get "goodjob"
    end
  end



  get'/users/index' => 'users#index'
  get'/user/show' => 'users#show'
  # authにへんこう
  devise_for :users, controllers: {
    auth: "/auth/:provider/callback",
    sessions: "users/sessions",
    registrations: "users/registrations",

    omniauth_callbacks: "users/omniauth_callbacks"
}
  get '/contact' => 'contacts#inquiry'
  post '/contact' => 'contacts#inquiry'
  post '/contact/confirm' => 'contacts#confirm'
  post '/contact/thankyou' => 'contacts#thankyou'

  resources :blogs do
    resources :comments
  end
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
   root 'top#index'
   resources :users, only: [:index, :show, :edit, :update] do
     resources :tasks
     member do
       get :following, :followers
     end
   end

   resources :relationships, only: [:create, :destroy]

   match "*path" => "application#handle_404", via: :all
end
