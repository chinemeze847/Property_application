require 'date'

PropertySchema = Dry::Schema.Params do
        required(:bedrooms).filled(:integer)
        required(:sitting_rooms).filled(:integer)
        required(:kitchens).filled(:integer)
        required(:toilets).filled(:integer)
        required(:bathrooms).filled(:integer)
        
        required(:description).filled(:string, min_size?: 5, max_size?: 250)

        required(:valid_from).filled(:date)
        optional(:valid_to).filled(:date)
    end