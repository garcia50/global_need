# == Schema Information
#
# Table name: users
#
# id              :bigint
# first_name      :string     
# last_name       :string     
# email           :string     
# phone           :string     
# sex             :string     
# age             :string     
# skills          :text       
# password_digest :string     
# created_at      :datetime 
# updated_at      :datetime 
# slug            :string     
#

class User < ApplicationRecord
  has_secure_password

  validates_presence_of :first_name, :last_name, :email, :password 
  validates_uniqueness_of :email
  validates :password, confirmation: { case_senstive: true }

  has_one :organzation
  # before_save :generate_slug

  def generate_slug
    self.slug = first_name.parameterize if first_name
  end

  def is_org_admin?
    organization.present?
  end

  def organization
    @organization ||= Organization.find_by(user_id: id)
  end

end