class Location < ApplicationRecord
  has_and_belongs_to_many :organizations
  has_many   :org_locs
  has_many   :organizations, through: :org_locs
end