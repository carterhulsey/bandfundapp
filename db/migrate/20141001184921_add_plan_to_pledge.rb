class AddPlanToPledge < ActiveRecord::Migration
  def change
    add_column :pledges, :plan, :string
  end
end
