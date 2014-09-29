class AddArtistColumns < ActiveRecord::Migration
  def change
    add_column :artists, :about_me, :text
    add_column :artists, :genre_id, :integer
    add_column :artists, :name, :string
    add_column :artists, :paypal_link, :string

  end
end
