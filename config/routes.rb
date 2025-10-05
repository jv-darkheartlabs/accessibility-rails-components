Rails.application.routes.draw do
  # Component preview routes (ViewComponent)
  mount ViewComponent::Engine, at: "/rails/view_components" if defined?(ViewComponent::Engine)
  
  # Root route - component library showcase
  root 'home#index'
  
  # Component showcase routes
  resources :components, only: [:index, :show] do
    member do
      get :accessibility_test
      get :code_sample
    end
  end
  
  # Accessibility testing routes
  namespace :accessibility do
    get :audit, to: 'audit#index'
    get :wcag_checklist, to: 'wcag#checklist'
    get :keyboard_navigation, to: 'navigation#keyboard'
    get :screen_reader, to: 'screen_reader#test'
  end
  
  # API for accessibility testing
  namespace :api do
    namespace :v1 do
      get :status, to: 'status#show'
      resources :components, only: [:index, :show]
      get 'accessibility_report', to: 'accessibility#report'
    end
  end
  
  # Health check
  get '/health', to: 'health#show'
end