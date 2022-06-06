class RemoveVerificationCountFromSpots < ActiveRecord::Migration[6.1]
  def change
    remove_column :spots, :verification_count, :integer
  end
end
