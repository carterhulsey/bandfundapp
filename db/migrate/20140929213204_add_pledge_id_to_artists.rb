class AddPledgeIdToArtists < ActiveRecord::Migration
  def change
    add_column :artists, :pledge_id, :int
  end
end
