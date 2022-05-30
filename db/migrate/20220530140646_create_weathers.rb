class CreateWeathers < ActiveRecord::Migration[6.1]
  def change
    create_table :weathers do |t|
      t.references :spot, null: false, foreign_key: true
      t.string :weather
      t.integer :wind_direction
      t.integer :wind
      t.integer :gust
      t.integer :tmin
      t.integer :tmax
      t.integer :probarain
      t.integer :uv
      t.datetime :datetime
      t.integer :high_tide
      t.integer :low_tide
      t.integer :day

      t.timestamps
    end
  end
end
