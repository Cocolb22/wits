class AddUpvoteAndDownvotToSpots < ActiveRecord::Migration[6.1]
  def change
    add_column :spots, :upvote, :integer, default: 0
    add_column :spots, :downvote, :integer, default: 0
  end
end
