Rails.application.routes.draw do

  resources :teams
  root 'teams#index'

  get 'seasons' => 'seasons#index', as: :seasons

  get 'seasons/edit'

  get 'seasons/update'

  get 'rounds/show/:id' => 'rounds#show', as: :show_round

  get 'rounds/index'

  get 'teams/classification' => 'teams#index_classification', as: :classification

  delete 'teams/:id' => 'teams#destroy', as: :teams_destroy

  post 'active' => 'seasons#update', as: 'post_active'
  patch 'match_results/:id' => 'match_results#update'

end
