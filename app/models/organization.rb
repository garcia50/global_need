# == Schema Information
#
# Table name: organizations
#
# id         :bigint
# name        :string  
# description :string  
# bio         :text    
# email       :string  
# phone       :string  
# created_at  :datetime
# updated_at  :datetime
# address     :string  
# user_id.    :bigint  
#

class Organization < ApplicationRecord
  validates_presence_of :name, :email, :address
  validates_uniqueness_of :name

  has_many :locations_organizations
  has_many :locations, through: :locations_organizations

  belongs_to :user, dependent: :destroy

  def self.search(search)
    where("name iLIKE ?", "%#{search}%") 
  end

  def is_user?
    user.present?
  end
end