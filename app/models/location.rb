class Location < ApplicationRecord
  has_many :locations_organizations
  has_many :organizations, through: :locations_organizations

  # geocoded_by :address
  # after_validation :geocode

  # reverse_geocoded_by :lat, :long
  # after_validation :reverse_geocode

  def address
    [country, state, city].compact.join(', ')
  end
end

# org = Organization.find(121)
#  loc = Location.create(country: "United States", state: "Georgia", city: "Los Angeles" )