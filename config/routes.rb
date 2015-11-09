Textbook::Application.routes.draw do
  devise_for :users

  root :to => 'home#show'

  get 'table-of-contents' => 'courses#index', :as => 'table_of_contents'
  get 'table_of_contents' => redirect('table-of-contents')

  resources :sections, except: [:show] do
    resources :lessons, except: [:new, :create, :show]
  end
  resources :lessons, except: [:edit]
  resources :courses
  get '/:id', to: 'sections#show', as: :section_show
  get '/:section_id/:id', to: 'lessons#show', as: :lesson_show
end
