class ChangeBagColorToInt < ActiveRecord::Migration
  def change
    change_column :bags, :color, :integer
  end
end
