Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)

  root "customers#index"

  get "customers/alphabetized",
      to: "customers#alphabetized",
      as: :customers_alphabetized

  get "customers/missing_email",
      to: "customers#missing_email",
      as: :customers_missing_email

  get "up" => "rails/health#show", as: :rails_health_check
end

# Pao Notes:
# A route connects an HTTP request and URL to a controller action.
# root sends GET / to the CustomersController index action.
# The as option creates a named route helper for use in the views.
# Devise and ActiveAdmin add the routes needed for the admin dashboard.