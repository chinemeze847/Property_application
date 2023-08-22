Rails.application.routes.draw do
  mount Rswag::Ui::Engine => '/api-docs'
  mount Rswag::Api::Engine => '/api-docs'
  # resources :properties do
  #   collection do
  #     get 'properties_by_owner/:owner', action: 'properties_by_owner', as: 'properties_by_owner'
  #     get 'properties_by_owner', action: 'properties_by_owner'
  #     get 'filter_by_bedrooms', action: 'filter_by_bedrooms'
  #     get 'filter_by_bathrooms', action: 'filter_by_bathrooms'
  #     get 'filter_by_address', action: 'filter_by_address'
  #   end
  #   member do
  #     patch 'update_properties'
  #   end
  # end
  namespace "api" do
    namespace "v1" do
      get "properties" => "properties#index"
      post "properties" => "properties#create"
      put "properties/:id" => "properties#update"
    end
  end
end
