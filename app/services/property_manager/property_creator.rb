module PropertyManager

    class PropertyCreator < PropertyService
        attr_reader :params, :properties
  
        def initialize(params)
            @params = params
        end

        def call

            is_valid_address = AddressValidator.call(params[:address])

            if !is_valid_address
                return {
                    "success" => false,
                    "message" => "Invalid address", 
                    "errors" => "Invalid address"
                }
            else
                property = Property.new(params)

                if property.save
                    return {
                        "success" => true,
                        "data" => property
                    }
                else
                    return {
                        "success" => false,
                        "message" => "Request unsuccessful.", 
                        "errors" => property.errors
                    }
                end
            end

        end

    end

end