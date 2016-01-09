Rails.application.routes.draw do

  post'/provider/:user_id' => 'providers#create',as:'provider'
  delete'/provider/:user_id' => 'providers#delete',as:'disprovier'
  post 'like/:blog_id' => 'likes#like',as: 'like'
  delete 'unlike/:blog_id' => 'likes#unlike',as: 'unlike'

  get'/users' => 'users#index'
  get'/user/:user_id' => 'users#show',as: 'user'
  # authにへんこう
  devise_for :users, controllers: {
    auth: "/auth/:provider/callback",
    auth: "/auth/destroy/:provider",
    sessions: "users/sessions",
    registrations: "users/registrations",

    omniauth_callbacks: "users/omniauth_callbacks"
}
  get '/contact' => 'contacts#inquiry'
  post '/contact/' => 'contacts#inquiry'
  post '/contact/confirm' => 'contacts#confirm'
  post '/contact/thankyou' => 'contacts#thankyou'

  resources :blogs
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
   root 'top#index'
  resources :users,only:[]do
    member do
      get :like_notes
  end

end
  end