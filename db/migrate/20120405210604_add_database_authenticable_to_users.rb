class AddDatabaseAuthenticableToUsers < ActiveRecord::Migration
  def change
    add_column :users, :database_authenticable
    add_column :users, :confirmable
  end
end
