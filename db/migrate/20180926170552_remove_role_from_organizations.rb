class RemoveRoleFromOrganizations < ActiveRecord::Migration[5.2]
  def change
    remove_column :organizations, :role, :integer
  end
end
