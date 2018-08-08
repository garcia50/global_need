class Organization < ApplicationRecord
  validates_presence_of :name

  def self.search(search)
    where("name LIKE ?", "%#{search}%") 
  end
end