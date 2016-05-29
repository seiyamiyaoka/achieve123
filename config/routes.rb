Rails.application.routes.draw do


  resources :sales, only: [:index, :new, :create] do
    collection do
      post 'confirm'
    end
  end

  get 'dave/dig'

  get 'dave/speak'

  get 'dave/teach'

  root 'top#index'
  post '/callback' => 'webhook#callback'


  get 'products/index'
  resources :tasks

  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'

  resources :answers
  resources :questions do
    resources :answers
  end

  namespace :taskline do
    resources :tasks do
      post "ungoodjob"
      post "goodjob"
    end
    resources :task_comments
  end

  get'/users/index' => 'users#index'
  get'/user/show' => 'users#show'

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

  resources 'products', only: :index


   resources :users, only: [:index, :show] do
     resources :tasks
     member do
       get :following, :followers
     end
     resources :submit, shallow: true do
       get 'approve'
       get 'unapprove'
       get 'reject'
       collection do
         get 'inbox'
       end
     end
   end

   resources :relationships, only: [:create, :destroy]

   get 'say/dave' => 'say#hello'
   get 'say/goodbye'
   get 'say/something'
   match "*path" => "application#handle_404", via: :all
end
