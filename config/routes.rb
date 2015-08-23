Rails.application.routes.draw do

  devise_for :users, :path => '/users', controllers: { registrations: 'users/registrations'}
  get 'welcome/index'

  # SAMLv2 IdP
  get '/saml/auth' => 'saml_idp#create'
  post '/saml/auth' => 'saml_idp#create'
  get '/saml/metadata' => 'saml_idp#show'

  root to: "welcome#index"
end
