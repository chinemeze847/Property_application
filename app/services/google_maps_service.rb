require 'google_maps_service'

class GoogleMapsServiceClass
  API_KEY = ENV['GOOGLE_MAPS_API_KEY'] # Use your actual Google Maps API key

  def self.validate_address(address)
    gmaps = GoogleMapsService::Client.new(key: API_KEY)

    puts "gmaps : " + ${gmaps}

    response = gmaps.geocode(address)

    if response[:status] == 'OK'
      # Extract relevant data from the API response
      result = response[:results].first
      validated_address = {
        formatted_address: result[:formatted_address],
        latitude: result[:geometry][:location][:lat],
        longitude: result[:geometry][:location][:lng],
        # Extract other relevant address components as needed
      }

      return validated_address
    else
      # Handle the case when address validation fails
      error_message = response[:error_message]
    end
  end
end