module PropertyManager

    class PropertyUpdater < ApplicationService
        attr_reader :params, :properties
  
        def initialize(params)
            @params = params
        end

        def call

            begin
                property = Property.find(params[:id])
            
                if property.update(params)
                    return {
                        "success" => true,
                        "data" => Property.find(params[:id])
                    }
                else 
                    return {
                        "success" => false,
                        "message" => "Request unsuccessful.", 
                        "errors" => property.errors
                    }
                end
            
            rescue ActiveRecord::RecordNotFound
                return {
                    "success" => false,
                    "message" => "Requested property not found.", 
                    "errors" => "Requested property not found."
                }
            end
        end

    end

end