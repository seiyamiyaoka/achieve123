Rails.application.routes.draw do

  get 'social_profile/create'=> 'social_profile#create'



  get'/users/index' => 'users#index'
  get'/user/show' => 'users#show'
  # authにへんこう
  devise_for :users, controllers: {
    auth: "/auth/:provider/callback",
    auth: "/auth/destroy/:provider",
    sessions: "users/sessions",
    registrations: "users/registrations",

    omniauth_callbacks: "users/omniauth_callbacks"
}
  get '/contact' => 'contacts#inquiry'
  post '/contact' => 'contacts#inquiry'
  post '/contact/confirm' => 'contacts#confirm'
  post '/contact/thankyou' => 'contacts#thankyou'

  resources :blogs
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
   root 'top#index'

end
