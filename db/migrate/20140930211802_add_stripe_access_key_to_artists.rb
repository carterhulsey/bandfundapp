class AddStripeAccessKeyToArtists < ActiveRecord::Migration
  def change
    add_column :artists, :access_token, :string
    add_column :artists, :stripe_publishable_key, :string
    add_column :artists, :stripe_user_id, :string
  end
end
