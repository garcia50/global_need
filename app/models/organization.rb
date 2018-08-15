class Organization < ApplicationRecord
  validates_presence_of :name
  validates_uniqueness_of :name

  # has_and_belongs_to_many :locations
  has_many :org_locs
  has_many :locations, through: :org_locs

  def self.search(search)
    where("name iLIKE ?", "%#{search}%") 
  end
end