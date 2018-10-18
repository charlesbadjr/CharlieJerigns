Rails.application.routes.draw do
  mount_devise_token_auth_for 'User', at: 'api/auth'

  namespace :api do
    get '/braintree_token', to: 'braintree#token'
    post '/payment', to: 'braintree#payment'
    #configure the TCN call flow
    get 'tcn/send', :to 'tcn#call'
    get 'tcn/receive'
    # configure API for Instagram
    get 'instagram/list'
  end

  #Do not place any routes below this one
  get '*other', to: 'static#index'
end
