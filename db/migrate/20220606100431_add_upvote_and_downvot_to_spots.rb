class AddUpvoteAndDownvotToSpots < ActiveRecord::Migration[6.1]
  def change
    add_column :spots, :upvote, :integer
    add_column :spots, :downvote, :integer
  end
end
