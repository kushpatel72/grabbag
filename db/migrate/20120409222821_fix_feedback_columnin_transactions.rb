class FixFeedbackColumninTransactions < ActiveRecord::Migration
  def change
    rename_column :transactions, :feeback, :feedback
  end
end
