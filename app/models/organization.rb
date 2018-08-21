class Organization < ApplicationRecord
  validates_presence_of :name
  validates_uniqueness_of :name

  has_many :locations_organizations
  has_many :locations, through: :locations_organizations

  def self.search(search)
    where("name iLIKE ?", "%#{search}%") 
  end
end