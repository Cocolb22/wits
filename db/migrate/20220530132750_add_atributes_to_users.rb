class AddAtributesToUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :last_name, :string
    add_column :users, :first_name, :string
    add_column :users, :nick_name, :string
    add_column :users, :address, :string
    add_column :users, :birthday, :date
    add_column :users, :gender, :string
    add_column :users, :profile_exp, :integer
    add_column :users, :status, :string
    add_column :users, :favorite_area, :string
  end
end
