class AddNameToPledges < ActiveRecord::Migration
  def change
    add_column :pledges, :first_name, :string
    add_column :pledges, :last_name, :string
    add_column :pledges, :country, :string
  end
end
