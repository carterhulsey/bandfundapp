class AddVideoUrlToArtists < ActiveRecord::Migration
  def change
    add_column :artists, :video_url, :string
  end
end
