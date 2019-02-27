class SubdomainConstraint

  def self.matches?(request)
    request.subdomain.present? && request.subdomain != 'www'
  end
end

Rails.application.routes.draw do

  constraints SubdomainConstraint do
    devise_for :users, :controllers => {:registrations => "registrations"} do
      get '/users/sign_up', :to => 'users/registrations#new'
    end
    # devise_for :users
    resources :employees do
      resources :compensations
    end

    resources :departments
  end

  get '/companies/edit', :to => 'companies#edit', :as => :company
  get '/summary', :to => 'departments#summary', :as => :summary
  patch '/companies/edit', :to => 'companies#update', :as => :company_update
  resource :companies, only: [:show, :edit, :update, :new]
  root 'employees#profile'

  get ':controller/:action' if  Rails.env.test?

end
