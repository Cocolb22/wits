class AddStreetToSpot < ActiveRecord::Migration[6.1]
  def change
    add_column :spots, :street, :string
    add_column :spots, :zipcode, :string
    add_column :spots, :city, :string
  end
end
