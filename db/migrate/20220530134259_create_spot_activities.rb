class CreateSpotActivities < ActiveRecord::Migration[6.1]
  def change
    create_table :spot_activities do |t|
      t.references :spot, null: false, foreign_key: true
      t.references :activity, null: false, foreign_key: true

      t.timestamps
    end
  end
end
