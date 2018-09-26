# == Schema Information
#
# Table name: locationsorganization
#
# organization_id :bigint  
# location_id     :bigint
#

class LocationsOrganization < ApplicationRecord
  belongs_to :organization
  belongs_to :location
end