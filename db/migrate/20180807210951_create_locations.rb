class CreateLocations < ActiveRecord::Migration[5.2]
  def change
    create_table :locations do |t|
      t.float :long, precision: 10, scale: 4
      t.float :lat, precision: 10, scale: 4
      t.string :country
      t.string :state
      t.string :city
      t.timestamps
    end
  end
end
