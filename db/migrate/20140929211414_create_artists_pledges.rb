class CreateArtistsPledges < ActiveRecord::Migration
  def change
    create_table :artists_pledges do |t|
      t.column :artist_id, :int
      t.column :pledge_id, :int
      t.column :price, :int
    end

    add_column :fans, :pledge_id, :int
  end
end
