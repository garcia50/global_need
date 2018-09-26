# == Schema Information
#
# Table name: locations
#
# id         :bigint
# long       :float 
# lat        :float 
# country    :string
# state      :string
# city       :string
# created_at :datetime
# updated_at :datetime
#

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
