Rails.application.routes.draw do
  resources :tasks

  patch '/task/:id/mark-as-done' => "tasks#mark_as_done", as: :mark_as_done
  patch '/task/:id/mark-as-to-do' => "tasks#mark_as_undone", as: :mark_as_undone
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
