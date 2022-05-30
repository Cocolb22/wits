class CreateServices < ActiveRecord::Migration[6.1]
  def change
    create_table :services do |t|
      t.references :spot, null: false, foreign_key: true
      t.boolean :parking, default: false
      t.boolean :restaurant, default: false
      t.boolean :shower, default: false
      t.boolean :camping, default: false
      t.boolean :beach_surveillance, default: false

      t.timestamps
    end
  end
end
