class AddAttributeBigIconToActivity < ActiveRecord::Migration[6.1]
  def change
    add_column :activities, :bigicon, :string
  end
end
