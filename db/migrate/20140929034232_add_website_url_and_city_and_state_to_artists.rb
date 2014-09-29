class AddWebsiteUrlAndCityAndStateToArtists < ActiveRecord::Migration
  def change
    add_column :artists, :website_url, :string
    add_column :artists, :city, :string
    add_column :artists, :state, :string
  end
end
