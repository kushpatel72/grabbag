class ChangeBuckleCountToButtonCount < ActiveRecord::Migration
  def change
    rename_column :users, :buckle_count, :button_count
  end
end
