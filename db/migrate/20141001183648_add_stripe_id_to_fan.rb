class AddStripeIdToFan < ActiveRecord::Migration
  def change
    add_column :fans, :stripe_id, :string
  end
end
