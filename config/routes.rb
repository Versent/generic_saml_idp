Rails.application.routes.draw do

  devise_for :users, :path => '/users', controllers: { registrations: 'users/registrations'}

  devise_scope :user do
    get '/saml/auth' => 'users/sessions#new_from_saml'
    post '/saml/auth' => 'users/sessions#create_from_saml'
    get '/confirmation_instructions' => 'users/registrations#confirmation_instructions'
    get '/new_candidate_portal' => 'dashboard#redirect_to_new_candidate_portal'
  end

  get 'welcome/index'

  get '/saml/metadata' => 'saml_idp#show'

  root to: "welcome#index"
end
