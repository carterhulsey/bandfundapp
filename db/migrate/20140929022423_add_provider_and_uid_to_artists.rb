class AddProviderAndUidToArtists < ActiveRecord::Migration
  def change
    add_column :artists, :provider, :string
    add_column :artists, :uid, :string
  end
end
