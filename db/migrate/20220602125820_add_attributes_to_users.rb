class AddAttributesToUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :last_name_completed, :boolean, default: false
    add_column :users, :first_name_completed, :boolean, default: false
    add_column :users, :address_completed, :boolean, default: false
    add_column :users, :birthday_completed, :boolean, default: false
    add_column :users, :gender_completed, :boolean, default: false
    add_column :users, :favorite_area_completed, :boolean, default: false
    add_column :users, :photo_completed, :boolean, default: false
  end
end
