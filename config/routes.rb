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

  namespace :sample do
    resources :games, only: [:index]

    scope :api do 
        resources :studios, only: [:index] do
            member do
                get 'info', to: 'studios#get_info'
            end
            collection do
                get 'first'
                get 'last'
            end
        end
        resources :jsons, defaults: { format: 'json' }, only: [:index] do
            collection do
                get 'get_json', to: 'jsons#get_json'
            end
        end
        get 'random', to: 'random#get_random'

        get 'mail', to: 'random_mail#send_random_mail'
        get 'studio-mail', to: 'random_mail#send_studio_mail'

        scope :session do
            get 'get', to: 'session#get_cookie'
            get 'set', to: 'session#set_cookie'
            get 'remove', to: 'session#remove_cookie'
            post 'post', to: 'session#post_cookie'
        end
    end
  end
end
