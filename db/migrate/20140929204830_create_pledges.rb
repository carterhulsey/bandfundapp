class CreatePledges < ActiveRecord::Migration
  def change
    create_table :pledges do |t|
      t.column :artist_id, :int
      t.column :fan_id, :int 
      t.timestamps
    end
  end
end
