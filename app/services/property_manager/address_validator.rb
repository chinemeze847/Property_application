module PropertyManager
    require 'httparty'

    class AddressValidator < PropertyService

        attr_reader :address
  
        def initialize(address)
            @address = address
        end

        
        def call

            api_key = ENV["API_KEY"]

            accept_level = 0.95

            search_address = "#{address}"

            if (!address.downcase().include? "nigeria")
                search_address += ", Nigeria"
            end

            url = "https://api.geoapify.com/v1/geocode/search?text=#{search_address}&apiKey=#{api_key}"

            response = HTTParty.get(url, format: :json)

            return false if response.code != 200

            response = JSON.parse(response.body)

            if response["features"].length == 0
                return false
            else
                if response["features"][0]["properties"]["rank"]["confidence"] >= accept_level
                    return true
                else
                    return false
                end
            end

        end    

    end
end