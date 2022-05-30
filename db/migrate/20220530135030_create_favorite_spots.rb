class CreateFavoriteSpots < ActiveRecord::Migration[6.1]
  def change
    create_table :favorites do |t|
      t.references :spot, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
