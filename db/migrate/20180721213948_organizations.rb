class Organizations < ActiveRecord::Migration[5.2]
  def change
    create_table :organizations do |t|
      t.string :name
      t.string :description
      t.text :bio
      t.string :email
      t.string :phone

      t.timestamps
    end
  end
end
