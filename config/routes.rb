Rails.application.routes.draw do
  resources :teams
  root 'teams#index'

  get 'seasons/edit'

  get 'seasons/update'

  get 'rounds/index'



  delete 'teams/:id' => 'teams#destroy', as: :teams_destroy

  post 'active' => 'seasons_controller#update', as: 'post_active'

end
