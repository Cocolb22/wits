class ChangeDefautlPRofileExp < ActiveRecord::Migration[6.1]
  def change
    change_column :users, :profile_exp, :integer, default: 10
  end
end
