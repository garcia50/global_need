class Location < ApplicationRecord
  has_many :locations_organizations
  has_many :organizations, through: :locations_organizations
end