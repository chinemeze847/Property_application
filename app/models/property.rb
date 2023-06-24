class Property < ApplicationRecord
  validates :address, presence: true, on: :create
  validates :property_type, presence: true, on: :create
  validates :description, presence: true
  validates :property_owner, presence: true
  validates :bedrooms, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  validates :sitting_rooms, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  validates :kitchens, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  validates :bathrooms, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  validates :toilets, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  validate :valid_to_date_must_be_after_today

  private

  def valid_to_date_must_be_after_today
    if valid_to.present? && valid_to <= Date.today
      errors.add(:valid_to, "must be a date after today")
    end
  end
end
