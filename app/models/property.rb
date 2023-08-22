class Property < ApplicationRecord
  validates :address, :property_type, :bedrooms, :sitting_rooms, :kitchens, :toilets, :bathrooms, :property_owner, :description, :valid_from, presence: true
end

