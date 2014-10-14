class AddBillingInfoToFan < ActiveRecord::Migration
  def change
    add_column :fans, :address_1, :string
    add_column :fans, :address_2, :string
    add_column :fans, :city, :string
    add_column :fans, :state, :string
    add_column :fans, :zip_code, :string
    add_column :fans, :country, :string
  end
end
