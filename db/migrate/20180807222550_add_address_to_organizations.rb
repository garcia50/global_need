class AddAddressToOrganizations < ActiveRecord::Migration[5.2]
  def change
    add_column :organizations, :address, :string
  end
end
