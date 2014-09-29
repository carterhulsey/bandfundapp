class CreateRewards < ActiveRecord::Migration
  def change
    create_table :rewards do |t|
      t.references :artist
      t.integer :price
      t.string :title
      t.text :description
      t.boolean :address_required

      t.timestamps
    end
  end
end
