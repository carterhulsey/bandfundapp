class AddItunesUrlToArtists < ActiveRecord::Migration
  def change
    add_column :artists, :itunes_url, :string
  end
end
