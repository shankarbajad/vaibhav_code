Rails.application.routes.draw do

  mount Ckeditor::Engine => '/ckeditor'
  ActiveAdmin.routes(self)
  # ActiveAdmin.routes(self)
#   namespace :admin do
#     resources :users
# resources :companies
# resources :company_documents
# resources :company_photos
# resources :faqs
# resources :investments
# resources :investment_documents
# resources :investment_photos
# resources :investment_videos
# resources :legals
# resources :questionnaires
# resources :reports
# resources :report_authors
# resources :report_categories
# resources :staffs
# resources :updates
# resources :user_documents
# resources :user_photos
# resources :user_videos
# resources :videos

  #   root to: "users#index"
  # end

  get 'public/index'

  get 'public/blog'

  get 'public/contact_us'

  get 'public/about'

  get 'public/team'

  get 'public/faq'

  get 'public/legal'

  get 'public/impact_investing'

  get 'pages/index'

  get 'pages/blog'

  get 'pages/contact_us'

  get 'pages/about'

  get 'pages/team'

  get 'pages/faq'

  get 'pages/legal'

  get 'pages/impact_investing'

  resources :legals
  resources :faqs


  # ActiveAdmin.routes(self)
  # resources :questionnaires, only: [:index] do
  #   get :change_status, on: :member
  # end

  resources :companies do
    get :crop
    get :get_cities_by_country_code, on: :collection
    resources :questionnaires do
      get :change_status, on: :member
    end
  end

  root to: 'visitors#index'

  resources :investments do
    get :crop
  end
  # resources :companies do
    
  # end
  


  resources :terms


  resources :after_signup
  
  devise_for :users, :controllers => { registrations: 'registrations', :omniauth_callbacks => "users/omniauth_callbacks" }
  get "users/crop" => "users#crop"
  resources :users do
    get :get_cities_by_country_code, on: :collection
    
    collection do
      get :filter_courses  
    end
  end

  resources :reports
  
  
  get "welcome" => "after_signup#welcome", as: :user_welcome
  get "location" => "after_signup#location", as: :user_location
  get "setup" => "after_signup#setup", as: :user_setup
  get "resume" => "after_signup#resume", as: :user_resume
  get '/faq', to: 'investments#faq'
  get '/privacy_policy', to: 'public#privacy_policy'

  end


