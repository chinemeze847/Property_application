class PropertyUpdateContract < Dry::Validation::Contract
    params(PropertySchema) do
        
        required(:id).filled(:integer)

    end
end