Rails.application.routes.draw do
  namespace 'v1' do
    resources :students, only: [:index, :create, :update, :destroy]
    resources :enrollments, only: [:index, :create]
  end
end

