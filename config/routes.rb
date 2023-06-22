Rails.application.routes.draw do
  resources :properties do
    collection do
      get 'properties_by_owner/:owner', action: 'properties_by_owner', as: 'properties_by_owner'
      get 'properties_by_owner', action: 'properties_by_owner'
      get 'filter_by_bedrooms', action: 'filter_by_bedrooms'
      get 'filter_by_bathrooms', action: 'filter_by_bathrooms'
      get 'filter_by_address', action: 'filter_by_address'
    end
  end
end
