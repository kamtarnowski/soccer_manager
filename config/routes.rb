Rails.application.routes.draw do
  resources :teams
  root 'teams#index'

  get 'seasons/edit'

  get 'seasons/update'

  get 'rounds/show/:id' => 'rounds#show', as: :show_round

  get 'rounds/index'



  delete 'teams/:id' => 'teams#destroy', as: :teams_destroy

  post 'active' => 'seasons#update', as: 'post_active'

end
