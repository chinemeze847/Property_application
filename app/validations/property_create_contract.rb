
class PropertyCreateContract < Dry::Validation::Contract
    params(PropertySchema) do
        
        required(:address).filled(:string)
        required(:property_type).filled(:string)
        required(:property_owner).filled(:string)
        required(:description).filled(:string)

    end
end