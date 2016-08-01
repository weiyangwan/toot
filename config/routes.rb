Rails.application.routes.draw do

  root 'static_pages#home'

  get '/about',  to: 'static_pages#about'
  get '/help',   to: 'static_pages#help'

  devise_for :users,
    :path_names => {
      :sign_in => 'login',
      :sign_out => 'logout',
      :sign_up => 'signup'}
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
