class AddColumnsToPledges < ActiveRecord::Migration
  def change
    add_column :pledges, :email, :string
    add_column :pledges, :address1, :string
    add_column :pledges, :address2, :string
    add_column :pledges, :city, :string 
    add_column :pledges, :state, :string 
    add_column :pledges, :zip, :string 
    remove_column :pledges, :credit_card, :string 
  end
end
