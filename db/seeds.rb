# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

Property.create!(
  address: '123 Main St',
  property_type: 'House',
  bedrooms: 3,
  sitting_rooms: 2,
  kitchens: 1,
  bathrooms: 2,
  toilets: 3,
  property_owner: 'John Doe',
  description: 'Beautiful house with a spacious backyard.',
  valid_from: Date.today,
  valid_to: Date.today + 1.month
)

Property.create!(
  address: '456 Elm St',
  property_type: 'Flat',
  bedrooms: 2,
  sitting_rooms: 1,
  kitchens: 1,
  bathrooms: 1,
  toilets: 1,
  property_owner: 'Jane Smith',
  description: 'Cozy flat in a convenient location.',
  valid_from: Date.today,
  valid_to: Date.today + 2.weeks
)
