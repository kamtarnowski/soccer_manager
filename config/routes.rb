Rails.application.routes.draw do

  resources :teams
  root 'teams#index'

  get 'seasons' => 'seasons#index', as: :seasons
  get 'rounds/show/:id' => 'rounds#show', as: :show_round
  get 'rounds/index'
  get 'seasons/classification' => 'seasons#index_classification', as: :classification
  get 'season/new' => 'seasons#new', as: :new_season

  delete 'teams/:id' => 'teams#destroy', as: :teams_destroy
  post 'active' => 'seasons#update', as: 'post_active'
  patch 'match_results/:id' => 'match_results#update'

end
