class AddRewardIdToPledge < ActiveRecord::Migration
  def change
    add_column :pledges, :reward_id, :int
  end
end
