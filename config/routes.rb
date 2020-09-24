Rails.application.routes.draw do
 
  get 'user',:to=>'access#menu'
  get 'access/menu'
  get 'access/login'
  post 'access/attempt_login'
  get 'access/logout'
  get 'manageplayers/filter'
  post 'manageplayers/sort'
  get 'manageplayers/search'
  get 'manageplayers/download'
  get 'manageplayers/sort_by_tot_rushing_yards'
  get 'manageplayers/sort_by_tot_longest_rush'
  get 'manageplayers/sort_by_tot_rushing_touch_downs'
  get 'manageplayers/sort_by_all_three'
  get 'users/show'
  resources :manageplayers, only: [:index,:show] 

  resources :users, only: [:new,:create]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
