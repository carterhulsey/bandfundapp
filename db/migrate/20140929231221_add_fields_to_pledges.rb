class AddFieldsToPledges < ActiveRecord::Migration
  def change
    add_column :pledges, :credit_card, :int
    add_column :pledges, :price, :int
  end
end
