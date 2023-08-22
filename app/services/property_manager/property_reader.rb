module PropertyManager

    class PropertyReader < ApplicationService
        attr_reader :filter_params, :properties
  
        def initialize(filter_params)
            @filter_params = filter_params
        end

        def call
            if filter_params[:id]
                @properties = Property.where("id = ?", filter_params[:id])
            else

                search_hash = [""]
                search_keys = [
                    :property_address, :property_type, :num_bedrooms, :num_sitting_rooms, :num_kitchen, :num_toilets, :num_bathrooms, :owner
                ];

                for key in search_keys

                    if filter_params[key] and search_hash.length() == 1
                        search_hash[0] += "#{key} = ?"
                        search_hash.push(filter_params[key])
                    elsif filter_params[key]
                        search_hash[0] += " and #{key} = ?"
                        search_hash.push(filter_params[key])
                    end
                end

                if (search_hash.length() < 2)
                    
                    @properties = Property.order("id DESC")
                else
                    
                    @properties = Property.where(search_hash).order("id DESC")
                end
                
            end

            return false unless 
            @properties 
            @properties
        end

    end

end