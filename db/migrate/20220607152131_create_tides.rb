class CreateTides < ActiveRecord::Migration[6.1]
  def change
    create_table :tides do |t|
      t.datetime :time
      t.string :tide_type
      t.references :weather, null: false, foreign_key: true

      t.timestamps
    end
  end
end
