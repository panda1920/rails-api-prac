Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: 'misc#hello'

  get 'nested', to: 'misc#nested'
  get 'different', to: 'misc#different'
  get 'param/:url_param', to: 'misc#parametrized'
  get 'allgame', to: 'misc#all_game'
  post 'post1', to: 'misc#post'
  post 'post2', to: 'misc#post_json'
  post 'post3', to: 'misc#post_protected'
  post 'postgame', to: 'misc#post_game'
  delete 'deletegame', to: 'misc#delete_oldest'
end
