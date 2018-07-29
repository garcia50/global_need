class AddRolesToOrganizations < ActiveRecord::Migration[5.2]
  def change
    add_column :organizations, :role, :integer, default: 0
  end
end
