class PropertyReadContract < Dry::Validation::Contract
    params do
        optional(:id).filled(:integer)
        optional(:bedrooms).filled(:integer)
        optional(:sitting_rooms).filled(:integer)
        optional(:kitchens).filled(:integer)
        optional(:toilets).filled(:integer)
        optional(:bathrooms).filled(:integer)
        
        optional(:address).filled(:string, min_size?: 5, max_size?: 300)
        optional(:property_type).filled(:string, min_size?: 5, max_size?: 150)
        optional(:property_owner).filled(:string, min_size?: 5, max_size?: 300)
    end
end