class ChangeBagBrandToInt < ActiveRecord::Migration
  def change
    change_column :bags, :brand, :integer
  end
end
