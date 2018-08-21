class LocationsOrganization < ApplicationRecord
  belongs_to :organization
  belongs_to :location
end