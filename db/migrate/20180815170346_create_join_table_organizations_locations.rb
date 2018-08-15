class CreateJoinTableOrganizationsLocations < ActiveRecord::Migration[5.2]
  def change
    create_join_table :organizations, :locations, table_name: 'org_locs' do |t|
    t.index [:organization_id, :location_id]
    end
  end
end