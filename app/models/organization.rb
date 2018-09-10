class Organization < ApplicationRecord
  validates_presence_of :name, :email
  validates_uniqueness_of :name

  has_many :locations_organizations
  has_many :locations, through: :locations_organizations

  belongs_to :user, dependent: :destroy

  def self.search(search)
    where("name iLIKE ?", "%#{search}%") 
  end
end