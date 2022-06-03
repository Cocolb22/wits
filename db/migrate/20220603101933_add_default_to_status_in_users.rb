class AddDefaultToStatusInUsers < ActiveRecord::Migration[6.1]
  def change
    change_column :users, :status, :string, default: "Marin d'eau douce"
  end
end
