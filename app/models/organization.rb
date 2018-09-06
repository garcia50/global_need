class Organization < ApplicationRecord
  has_secure_password

  validates_presence_of :name, :email, :password
  validates_uniqueness_of :name
  validates :password, confirmation: { case_senstive: true }

  has_many :locations_organizations
  has_many :locations, through: :locations_organizations

  def self.search(search)
    where("name iLIKE ?", "%#{search}%") 
  end
end