class CreateSpots < ActiveRecord::Migration[6.1]
  def change
    create_table :spots do |t|
      t.references :user, null: false, foreign_key: true
      t.string :full_name
      t.string :address
      t.float :longitude
      t.float :latitude
      t.text :description
      t.string :type
      t.string :icon
      t.string :category
      t.integer :verification_count, default: 0
      t.boolean :verified, default: false

      t.timestamps
    end
  end
end
