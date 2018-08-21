class CreateJoinTableOrganizationsLocations < ActiveRecord::Migration[5.2]
  def change
    create_join_table :organizations, :locations do |t|
      t.index [:organization_id, :location_id], unique: true, name: 'org_loc'
    end
  end
end
